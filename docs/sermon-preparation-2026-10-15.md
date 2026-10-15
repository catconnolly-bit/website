# Nine sermons prepared for review — October 15, 2026

Status: prepared and locally verified; approved for publication on October 15, 2026.

Local preview: [Sermon archive](http://127.0.0.1:4000/writings/sermons/).

## Prepared pages

| Sermon date | Website page | Source Google Doc |
| --- | --- | --- |
| 2026-06-07 | [Mercy Made Visible](http://127.0.0.1:4000/writings/mercy-made-visible/) | [Sermon June 7](https://docs.google.com/document/d/1jo1Gu-evOtwoErP0ezULv1Oho5Qs3Gjffi4PfHkEqn8/edit?usp=drivesdk) |
| 2026-06-21 | [Worth More Than Many Sparrows](http://127.0.0.1:4000/writings/worth-more-than-many-sparrows/) | [Sermon June 21](https://docs.google.com/document/d/1tbvHKTCiv3ae_jIuIF43XLdpk32uqQSitKL6G4Xw-sQ/edit?usp=drivesdk) |
| 2026-07-05 | [Grace for the Divided Heart](http://127.0.0.1:4000/writings/grace-for-the-divided-heart/) | [Sermon July 5](https://docs.google.com/document/d/1zcx6IeDcnXTcgZS7CUGpP98CvI32dR2tCheWbkRbY54/edit?usp=drivesdk) |
| 2026-07-12 | [An Ecosystem of Grace](http://127.0.0.1:4000/writings/an-ecosystem-of-grace/) | [Sermon July 12](https://docs.google.com/document/d/11vyJ0QZfAkqWL-Ho8Xq-oqZtw2RhGs5spVHKJQU7_ew/edit?usp=drivesdk) |
| 2026-08-09 | [I AM WHO I AM](http://127.0.0.1:4000/writings/i-am-who-i-am/) | [Sermon August 9: I AM](https://docs.google.com/document/d/1S0SgCkKfKdt1z1nOvc7FWzPPCM2J5RoSQX15DJZdCuo/edit?usp=drivesdk) |
| 2026-08-23 | [Fragile People, Faithful God](http://127.0.0.1:4000/writings/fragile-people-faithful-god/) | [Sermon August 23](https://docs.google.com/document/d/1YNgLaZkFnqOvPDYj4T3cA51IqNISdf40p9fMOC3yJWE/edit?usp=drivesdk) |
| 2026-08-30 | [Sweeter than Honey](http://127.0.0.1:4000/writings/sweeter-than-honey/) | [Sermon August 30](https://docs.google.com/document/d/1SKqjSmDyLwBWeVjMvBkuiSkbNybmjDb0BNj-K213V1A/edit?usp=drivesdk) |
| 2026-09-06 | [The Good Place](http://127.0.0.1:4000/writings/the-good-place/) | [Sermon Sept 6](https://docs.google.com/document/d/1nl2FBep9Kdl86DdazdVSU8YhYwXcZdnZozCLYdECpbI/edit?usp=drivesdk) |
| 2026-09-27 | [Turn and Live](http://127.0.0.1:4000/writings/turn-and-live/) | [Sermon Sept 27](https://docs.google.com/document/d/1uoUmQ6iikul8y-Wxm6VpTPZH21NFTLeneDhvdKgKm9A/edit?usp=drivesdk) |

Excluded: all funeral homilies, Southminster, and the unfinished October 18 sermon. The older Trinity sermon was already present and was not imported again.

## Content and images

- Refreshed all nine Google Docs before preparing the pages. Source documents were read without modification.
- Preserved sermon wording, paragraph boundaries, emphasis, and closing Amen. Applied only the approved website titles, standard website typography, and relocation of Bible references.
- Each page uses category Sermons, the sermon date at noon UTC, its title slug, a hidden opening excerpt, and the existing layout and archive/search system.
- References follow Amen, followed by the matching nature image. The six existing titles were retained, with website capitalization; the other three use the approved titles.
- Created nine original nature images using the built-in imagegen tool. Retained PNG originals in the project, produced optimized WebP images (maximum dimension 1600, quality 85), and centered 600 × 556 WebP thumbnails (quality 82).
- Image filenames use each page's slug. All 110 existing image manifest entries and existing image files were preserved; nine mappings were added.
- Exact prompts and all saved image paths are in [the image prompt record](sermon-image-prompts-2026-10-15.json).

![The nine archive thumbnail crops](sermon-preparation-2026-10-15-images.jpg)

## Verification

- `bundle exec jekyll build`: passed.
- Compared all nine rendered pages against fresh source document text, including every paragraph, inline emphasis, references, and Amen: passed.
- Verified correct page titles, displayed sermon dates, page links, and loaded images: passed.
- Sermons archive: 94 entries, including exactly nine new sermons in date order.
- All writings archive: 120 entries, including the same nine new sermons in date order.
- Verified body-text searches for “sarx,” “Eleanor Shellstrop,” and “scorecards” in both archives.
- Desktop (1440 × 1000) and mobile (390 × 844) checks covered the sermon archive, Turn and Live, An Ecosystem of Grace, and Fragile People, Faithful God. No horizontal overflow, page script errors, or missing local resources were detected.
- Visually reviewed archive layout, mobile reading layout, reference/image placement, and all nine thumbnail crops.
- Writings landing page automatically features Turn and Live and The Good Place.
- Existing user changes in AGENTS.md and the pre-existing untracked tmp directory were left intact.

Local verification scripts, source comparison snapshots, detailed results, and screenshots are retained in the ignored .jekyll-cache/sermon-preparation-2026-10-15 directory.
