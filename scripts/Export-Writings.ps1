$ErrorActionPreference = "Stop"

Set-StrictMode -Version Latest

$projectRoot = Split-Path -Parent $PSScriptRoot
$sourceCsv = Join-Path $projectRoot "docs\inventory\writings-assets.csv"
$outputDir = Join-Path $projectRoot "_writings"
$cacheDir = Join-Path $projectRoot "docs\cache\writings"
$inlineImageDir = Join-Path $projectRoot "assets\images\writings\inline"
$inlineManifestPath = Join-Path $projectRoot "docs\inventory\writing-inline-assets.csv"

foreach ($directory in @($outputDir, $cacheDir, $inlineImageDir)) {
  if (-not (Test-Path $directory)) {
    New-Item -ItemType Directory -Path $directory | Out-Null
  }
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

function Write-Utf8NoBom {
  param(
    [Parameter(Mandatory = $true)]
    [string] $Path,

    [Parameter(Mandatory = $true)]
    [string] $Content
  )

  [System.IO.File]::WriteAllText($Path, $Content, $utf8NoBom)
}

function Get-WixFileName {
  param(
    [Parameter(Mandatory = $true)]
    [string] $Url
  )

  $uri = [System.Uri] $Url
  $segments = $uri.AbsolutePath.Trim("/") -split "/"
  $fileName = [System.Uri]::UnescapeDataString($segments[-1])

  if ([string]::IsNullOrWhiteSpace($fileName) -or ($fileName -notmatch "\.")) {
    throw "Could not determine file name from URL: $Url"
  }

  return $fileName
}

function Get-CachedHtml {
  param(
    [Parameter(Mandatory = $true)]
    [string] $Url,

    [Parameter(Mandatory = $true)]
    [string] $Slug
  )

  $cachePath = Join-Path $cacheDir "$Slug.html"

  if (-not (Test-Path $cachePath)) {
    $html = curl.exe -s -L -A "Mozilla/5.0" $Url
    if ([string]::IsNullOrWhiteSpace($html)) {
      throw "Failed to fetch HTML for $Url"
    }
    Write-Utf8NoBom -Path $cachePath -Content $html
  }

  return Get-Content -Path $cachePath -Raw
}

function Get-FirstArticleHtml {
  param(
    [Parameter(Mandatory = $true)]
    [string] $Html,

    [Parameter(Mandatory = $true)]
    [string] $Slug
  )

  $match = [regex]::Match($Html, '<article class="tgMH9T".*?</article>', [System.Text.RegularExpressions.RegexOptions]::Singleline)
  if (-not $match.Success) {
    throw "Could not find primary article HTML for $Slug"
  }

  return $match.Value
}

function Get-DescriptionSection {
  param(
    [Parameter(Mandatory = $true)]
    [string] $ArticleHtml,

    [Parameter(Mandatory = $true)]
    [string] $Slug
  )

  $match = [regex]::Match($ArticleHtml, '<section[^>]*data-hook="post-description"[^>]*>.*?</section>', [System.Text.RegularExpressions.RegexOptions]::Singleline)
  if (-not $match.Success) {
    throw "Could not find post-description section for $Slug"
  }

  return $match.Value
}

function Normalize-Whitespace {
  param(
    [Parameter(Mandatory = $true)]
    [string] $Value
  )

  $decoded = [System.Net.WebUtility]::HtmlDecode($Value)
  return ([regex]::Replace($decoded, '\s+', ' ')).Trim()
}

function Quote-Yaml {
  param(
    [AllowNull()]
    [string] $Value
  )

  if ($null -eq $Value) {
    return '""'
  }

  $escaped = $Value -replace '\\', '\\'
  $escaped = $escaped -replace '"', '\"'
  $escaped = $escaped -replace "`r", " "
  $escaped = $escaped -replace "`n", " "
  return '"' + $escaped.Trim() + '"'
}

$knownAssets = @{}
Get-ChildItem -Path (Join-Path $projectRoot "assets\images\writings") -File -Recurse | ForEach-Object {
  $relative = $_.FullName.Substring($projectRoot.Length + 1).Replace("\", "/")
  $knownAssets[$_.Name] = $relative
}

$resolvedAssets = @{}
$inlineAssetRows = New-Object System.Collections.Generic.List[object]

function Resolve-LocalAssetPath {
  param(
    [Parameter(Mandatory = $true)]
    [string] $Url,

    [Parameter(Mandatory = $true)]
    [string] $Slug
  )

  if ($resolvedAssets.ContainsKey($Url)) {
    return $resolvedAssets[$Url]
  }

  $fileName = Get-WixFileName -Url $Url

  if ($knownAssets.ContainsKey($fileName)) {
    $relative = $knownAssets[$fileName]
    $resolvedAssets[$Url] = $relative
    return $relative
  }

  $targetPath = Join-Path $inlineImageDir $fileName
  if (-not (Test-Path $targetPath)) {
    curl.exe -s -L -A "Mozilla/5.0" $Url -o $targetPath
    if (-not (Test-Path $targetPath)) {
      throw "Failed to download inline asset for ${Slug}: $Url"
    }
  }

  $relative = ("assets/images/writings/inline/" + $fileName)
  $knownAssets[$fileName] = $relative
  $resolvedAssets[$Url] = $relative
  $inlineAssetRows.Add([pscustomobject]@{
    Slug = $Slug
    SourceUrl = $Url
    LocalPath = $relative
  }) | Out-Null

  return $relative
}

function Convert-SectionHtml {
  param(
    [Parameter(Mandatory = $true)]
    [string] $SectionHtml,

    [Parameter(Mandatory = $true)]
    [string] $Slug
  )

  $converted = $SectionHtml
  $converted = [regex]::Replace($converted, '^\s*<section[^>]*>', '<div>', [System.Text.RegularExpressions.RegexOptions]::Singleline)
  $converted = [regex]::Replace($converted, '</section>\s*$', '</div>', [System.Text.RegularExpressions.RegexOptions]::Singleline)
  $converted = [regex]::Replace($converted, '<div\s+type="(?:first|last)"[^>]*></div>', '', [System.Text.RegularExpressions.RegexOptions]::Singleline)
  $converted = [regex]::Replace($converted, '\s(?:class|id|dir|type|data-[\w-]+|draggable|aria-label)="[^"]*"', '', [System.Text.RegularExpressions.RegexOptions]::Singleline)
  $converted = [regex]::Replace($converted, '<span>\s*</span>', '', [System.Text.RegularExpressions.RegexOptions]::Singleline)
  $converted = [regex]::Replace($converted, '<button[^>]*>.*?</button>', '', [System.Text.RegularExpressions.RegexOptions]::Singleline)
  $converted = [regex]::Replace($converted, '</?wow-image[^>]*>', '', [System.Text.RegularExpressions.RegexOptions]::Singleline)
  $converted = [regex]::Replace($converted, '^\s*<div>', '<div class="wix-rich-content">', [System.Text.RegularExpressions.RegexOptions]::Singleline)

  $assetMatches = [regex]::Matches($converted, 'https://static\.wixstatic\.com/media/[^"''\s)<>]+')
  $assetUrls = $assetMatches | ForEach-Object { $_.Value } | Sort-Object -Unique

  foreach ($assetUrl in $assetUrls) {
    $localPath = Resolve-LocalAssetPath -Url $assetUrl -Slug $Slug
    $replacement = "{{ '/$localPath' | relative_url }}"
    $converted = $converted.Replace($assetUrl, $replacement)
  }

  $converted = [regex]::Replace(
    $converted,
    'https://www\.catconnolly\.com/post/([a-z0-9\-_]+)',
    {
      param($match)
      return "{{ '/writings/$($match.Groups[1].Value)/' | relative_url }}"
    }
  )

  return $converted.Trim()
}

$rows = Import-Csv -Path $sourceCsv

foreach ($row in $rows) {
  $slug = $row.Slug.Trim()
  $html = Get-CachedHtml -Url $row.Url -Slug $slug
  $article = Get-FirstArticleHtml -Html $html -Slug $slug
  $section = Get-DescriptionSection -ArticleHtml $article -Slug $slug
  $contentHtml = Convert-SectionHtml -SectionHtml $section -Slug $slug

  $ogDescription = [regex]::Match($html, '<meta property="og:description" content="([^"]*)"', [System.Text.RegularExpressions.RegexOptions]::Singleline).Groups[1].Value
  $excerpt = Normalize-Whitespace -Value $ogDescription
  if ($excerpt.Length -gt 240) {
    $excerpt = $excerpt.Substring(0, 240).TrimEnd() + "..."
  }

  $localImage = "/" + $row.LocalPath.TrimStart("/").Replace("\", "/")
  $fileName = "post-$slug.html"
  $targetPath = Join-Path $outputDir $fileName

  $frontMatter = @(
    "---"
    "title: " + (Quote-Yaml -Value $row.Title.Trim())
    "date: " + $row.Date.Trim()
    "category: " + (Quote-Yaml -Value $row.Category.Trim())
    "slug: " + (Quote-Yaml -Value $slug)
    "permalink: " + (Quote-Yaml -Value "/writings/$slug/")
    "excerpt: " + (Quote-Yaml -Value $excerpt)
    "image: " + (Quote-Yaml -Value $localImage)
    "source_url: " + (Quote-Yaml -Value $row.Url.Trim())
    "---"
    ""
  )

  Write-Utf8NoBom -Path $targetPath -Content (($frontMatter -join "`n") + $contentHtml + "`n")
}

if ($inlineAssetRows.Count -gt 0) {
  $inlineAssetRows | Sort-Object Slug, SourceUrl | Export-Csv -Path $inlineManifestPath -NoTypeInformation
}
elseif (-not (Test-Path $inlineManifestPath)) {
  Write-Utf8NoBom -Path $inlineManifestPath -Content "Slug,SourceUrl,LocalPath`n"
}

Write-Host "Exported $($rows.Count) writings to $outputDir"
