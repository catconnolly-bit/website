# AGENTS.md

## Project
- Static Jekyll site for Cat Connolly.
- Hosted on GitHub Pages.
- Goal is to mirror the public site content and visual style without Wix-specific features like chat or store support.

## Stack
- Jekyll
- Markdown
- Liquid templates
- CSS

## Key Commands
- Install deps: `bundle install`
- Run locally: `bundle exec jekyll serve`
- Build site: `bundle exec jekyll build`

## Important Paths
- Pages: root `*.md` files like `index.md`, `about.md`, `vocation.md`, `courses.md`, `lent-course.md`
- Writings collection: `_writings/`
- Layouts: `_layouts/`
- Includes: `_includes/`
- Site styles: `assets/css/site.css`
- Images: `assets/images/`
- PDFs: `assets/pdfs/`

## Notes
- This repo currently uses the GitHub Pages project URL, so internal links and assets should use Jekyll filters like `relative_url`.
- The live content was migrated from `https://www.catconnolly.com/`.
- Keep the site lightweight and static. Do not add Wix-like dynamic features unless explicitly requested.
- When asked to upload a new sermon, essay, or poem, assume the site's standard writing formatting unless the user says otherwise.
- Add new sermons, essays, and poems as entries in `_writings/` with the appropriate category so they appear in the correct writings section automatically.
