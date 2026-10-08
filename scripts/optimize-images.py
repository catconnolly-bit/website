"""Create web images from retained originals and update site references (requires Pillow)."""
import json
import re
from pathlib import Path

from PIL import Image, ImageOps

ROOT = Path(__file__).resolve().parents[1]
sources = list(ROOT.glob('*.md'))
for directory in ('_writings', '_includes', '_layouts'):
    sources.extend(p for p in (ROOT / directory).rglob('*') if p.suffix in ('.md', '.html'))
pattern = re.compile(r'/assets/images/[^\s\'"{}<>]+\.(?:jpg|jpeg|png)(?:\.webp)?')
references = {ref for path in sources for ref in pattern.findall(path.read_text(encoding='utf-8'))}
replacements = {}
variants = {}
before = after = 0
for reference in sorted(references):
    original = reference.replace('/assets/images/optimized/', '/assets/images/')
    if original.endswith('.webp'):
        original = original[:-5]
    source = ROOT / original.lstrip('/')
    if not source.is_file():
        raise FileNotFoundError(source)
    relative = original.removeprefix('/assets/images/')
    optimized = '/assets/images/optimized/' + relative + '.webp'
    target = ROOT / optimized.lstrip('/')
    target.parent.mkdir(parents=True, exist_ok=True)
    with Image.open(source) as raw:
        image = ImageOps.exif_transpose(raw).convert('RGBA' if 'A' in raw.getbands() else 'RGB')
        web = image.copy()
        limit = 2040 if relative.startswith('home/') else 1600
        web.thumbnail((limit, limit), Image.Resampling.LANCZOS)
        web.save(target, 'WEBP', quality=85, method=6)
        if relative.startswith('writings/') and '/inline/' not in original:
            thumbnail = '/assets/images/thumbnails/' + relative + '.webp'
            thumb_target = ROOT / thumbnail.lstrip('/')
            thumb_target.parent.mkdir(parents=True, exist_ok=True)
            thumb = ImageOps.fit(image, (600, 556), method=Image.Resampling.LANCZOS)
            thumb.save(thumb_target, 'WEBP', quality=82, method=6)
            variants[optimized] = {'thumbnail': thumbnail}
    replacements[reference] = optimized
    before += source.stat().st_size
    after += target.stat().st_size
for path in sources:
    content = path.read_text(encoding='utf-8')
    updated = pattern.sub(lambda match: replacements[match.group()], content)
    if updated != content:
        path.write_text(updated, encoding='utf-8')
(ROOT / '_data' / 'image_variants.json').write_text(json.dumps(variants, indent=2) + '\n', encoding='utf-8')
print(f'{len(references)} images: {before:,} -> {after:,} bytes; {len(variants)} thumbnails.')
