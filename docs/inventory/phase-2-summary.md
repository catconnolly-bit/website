# Phase 2 Summary

Date: 2026-03-15

Phase 2 focused on copying live-site media into the local Jekyll project.

## Downloaded Assets

### PDFs

Lent Course PDFs were downloaded into:

- `assets/pdfs/lent-course/`

Count:

- 6 PDF files

### Images

Images were downloaded into:

- `assets/images/branding/`
- `assets/images/shared/`
- `assets/images/home/`
- `assets/images/vocation/`
- `assets/images/about/`
- `assets/images/writings/`
- `assets/images/courses/`
- `assets/images/lent-course/`

Counts:

- total local image files: 88
- writings image files: 73
- non-writings image files: 15

Notes:

- `writings-assets.csv` maps all 74 writings to local image paths
- 74 of 74 writings now have image mappings
- 73 local writings image files means at least one image is reused across multiple posts

## Manifests

Generated inventory/manifests:

- `page-assets.csv`
- `writings-assets.csv`

What they contain:

- `page-assets.csv`: page/source-asset to local-file mapping for the required site pages and writings/category pages
- `writings-assets.csv`: writing slug/title/category/date to source image and local image path mapping

## Current Local Asset State

Ready for implementation:

- local logo asset
- local footer social icons
- local homepage hero image
- local vocation image
- local courses and Lent Course images
- local writings images
- local Lent Course PDFs

## Phase 2 Outcome

The project now has the core media required to stop depending on Wix-hosted files for the pages and writings inventory already captured in Phase 1.

Next implementation step:

- replace the starter Jekyll theme structure with custom layouts/includes
- wire the local assets into rebuilt pages
- begin migrating page text and writings content into Jekyll files
