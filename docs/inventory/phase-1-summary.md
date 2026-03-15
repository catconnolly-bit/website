# Phase 1 Summary

Date: 2026-03-15

This folder documents the live Wix site before migration work begins.

## Source Site

- Home: `https://www.catconnolly.com/`
- Vocation: `https://www.catconnolly.com/about-4`
- About: `https://www.catconnolly.com/about`
- Writings: `https://www.catconnolly.com/writings`
- Courses: `https://www.catconnolly.com/courses`
- Lent Course: `https://www.catconnolly.com/lent-course`
- YouTube: `https://www.youtube.com/user/katycat49`

## Navigation

Current top navigation on the live site:

- Home
- Vocation
- About
- Writings
- Courses
- YouTube

Current Courses submenu:

- Lent Course

See `navigation-and-social.txt` for the current source links.

## Page-Level Findings

### Home

Observed headings:

- REV. CATHERINE CONNOLLY
- Priest - Preacher - Pastor
- Prayer & Worship
- LET'S CONNECT

Observed content:

- logo in header
- six-item primary navigation
- large hero image with overlaid name and subtitle
- introductory ministry paragraph
- Prayer & Worship section with embedded video area and descriptive copy
- contact email
- footer social bar

### Vocation

Observed headings:

- Vocation to Ministry
- Ministerial Identity
- Core Areas of Ministry

Observed content:

- same shared site header/footer shell
- one primary page image
- long-form vocational statement
- sectioned ministry description

### About

Observed headings:

- About

Observed content:

- same shared site header/footer shell
- biography page
- long-form prose content

### Writings

Observed content:

- archive landing page with featured/most recent writings
- category views for Poetry, Sermons, Essays
- pagination
- individual post pages under `/post/<slug>`

### Courses

Observed headings:

- Courses

Observed content:

- courses landing page
- Lent Course callout/link
- course-related image assets

### Lent Course

Observed headings:

- Lent Course
- Fear Not: When God Interrupts Our Lives
- Get Up and Go: Risky Faith and Costly Obedience
- You Have Found Favor: Messengers of Mercy
- Strength for the Struggle: Angels in the Wilderness and the Garden
- He Is Not Here: Hope that Sends Us

Observed content:

- standalone course page at `/lent-course`
- intro section
- five week sections
- six PDF links currently served from Wix file storage
- multiple localizable course images

## Writings Inventory

The category pages expose a complete writings count in Wix page data.

- Sermons: 49
- Poetry: 24
- Essays: 1
- Total writings captured in inventory: 74

Inventory file:

- `writings.csv`

Columns:

- `Category`
- `Date`
- `Title`
- `Slug`
- `Url`
- `SourcePage`

Notes:

- The main Writings page is not the full archive.
- The category pages plus pagination are the correct source for complete migration coverage.

## Assets and Files

Generated inventories:

- `assets-by-page.txt`
- `lent-course-pdfs.txt`
- `navigation-and-social.txt`
- `writings.csv`
- `writings-counts.txt`

Current asset counts by page:

- Home: 5
- Vocation: 5
- About: 4
- Writings: 15
- Courses: 6
- Lent Course: 11

Notes:

- These counts are based on unique `static.wixstatic.com/media/...` source asset URLs found in the page HTML.
- Footer social icons are currently linked to Wix-owned Facebook, Twitter/X, and LinkedIn destinations on the live site.
- The site also includes a Wix chat widget, which is intentionally out of scope for migration.

## Phase 1 Outcome

Phase 1 is sufficient to begin Phase 2 extraction and implementation:

- source pages identified
- navigation and external links identified
- writings archive enumerated
- Lent Course PDFs identified
- page asset lists captured for the required tabs

Open verification item for Phase 2:

- visually confirm whether any About/Courses imagery is injected differently from the source URLs captured here and backfill if needed during extraction
