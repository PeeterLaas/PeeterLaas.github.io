# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal academic portfolio for Peeter Laas (PhD, molecular ecology / environmental microbiology), hosted on GitHub Pages at https://peeterlaas.github.io.

## Deployment

```bash
./update.sh "Add a new talk"   # check assets, commit, push  ← the normal way
```

No local build step is needed: `index.html` has no YAML front matter, so Jekyll
copies it verbatim, and GitHub Pages serves it on push to `main`.

`update.sh` refuses to push if `index.html` references a local image, video or
PDF that is not on disk — both `src`/`href` attributes and CSS `url(...)`. That
is the failure this site actually has: a broken box on a live portfolio page,
noticed by a visitor rather than by you.

## Architecture

The site recently migrated from a multi-page Jekyll structure to a **single-file SPA**. All visible content and client-side navigation logic now lives in `index.html`. The six sections (Home, Current Work, Past Work, Education, Events & Honours, Gallery) are rendered and switched via vanilla JavaScript — no framework involved.

- `index.html` — entire site content, the whole theme, and the JS navigation logic
- `assets/css/style.scss` — dark-mode overrides for the Minima Jekyll theme. Vestigial: `index.html` has no YAML front matter, so Jekyll copies it verbatim and this stylesheet never reaches it.
- `assets/images/` — fieldwork and lab photo galleries
- `assets/images/molecular-mark.png` — the tube-and-plasmid mark used as the fixed page watermark, background-stripped from `assets/logos/uu_sigill_right.png` in the MolEcoMeth course repo, where it sits behind the lecture slides
- `assets/CV_2026-02-15.pdf` — current CV
- `_layouts/default.html` — minimal Jekyll layout wrapper inheriting from Minima base
- `_config.yml` — Jekyll config: theme, plugins (seo-tag, feed, sitemap, gist), kramdown/Rouge

## Theme

`index.html` is light: warm paper (`--bg: #f7f5f0`), near-white surfaces, deep
teal accent (`--accent: #1c6b59`), matching the light lecture decks in the
MolEcoMeth course repo but with serif display headings rather than the decks'
single grotesque. Every colour is a CSS variable declared once in `:root`, so a
palette change is that one block — do not reintroduce hardcoded hex values in
rules or inline styles.

The molecular watermark is `body::after`: fixed, bottom-right, ~5% opacity.
`main` is lifted to `z-index: 1` and the sidebar to `100` so the mark stays
behind both.

No Tallinn University logo anywhere — deliberate.

## Key Notes

- `_config.yml` still lists `header_pages` referencing deleted `.md` files (education.md, current-work.md, etc.) — these were removed during the SPA migration and the config entry is now a no-op.
- Google Fonts used: DM Serif Display, DM Mono, Jost.
- The course announcement on the home page (`.now-card`) and the linked entry in the Presentations section are the two places that reference outside sites; when a talk stops being upcoming it moves from the card into the presentations list.
- No JavaScript dependencies or package manager — pure vanilla JS/CSS.
- `.claude/settings.local.json` pre-authorizes common git operations.
