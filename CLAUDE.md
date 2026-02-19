# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal academic portfolio for Peeter Laas (PhD, molecular ecology / environmental microbiology), hosted on GitHub Pages at https://peeterlaas.github.io.

## Deployment

No local build step is needed. GitHub Pages automatically runs Jekyll on push to `main`. To deploy changes:

```bash
git add <files>
git commit -m "message"
git push
```

## Architecture

The site recently migrated from a multi-page Jekyll structure to a **single-file SPA**. All visible content and client-side navigation logic now lives in `index.html`. The six sections (Home, Current Work, Past Work, Education, Events & Honours, Gallery) are rendered and switched via vanilla JavaScript — no framework involved.

- `index.html` — entire site content and JS navigation logic
- `assets/css/style.scss` — dark-mode overrides for the Minima Jekyll theme (uses CSS variables, teal accent `#5eb8a0`)
- `assets/images/` — fieldwork and lab photo galleries
- `assets/CV_2026-02-15.pdf` — current CV
- `_layouts/default.html` — minimal Jekyll layout wrapper inheriting from Minima base
- `_config.yml` — Jekyll config: theme, plugins (seo-tag, feed, sitemap, gist), kramdown/Rouge

## Key Notes

- `_config.yml` still lists `header_pages` referencing deleted `.md` files (education.md, current-work.md, etc.) — these were removed during the SPA migration and the config entry is now a no-op.
- Google Fonts used: DM Serif Display, DM Mono, Jost.
- No JavaScript dependencies or package manager — pure vanilla JS/CSS.
- `.claude/settings.local.json` pre-authorizes common git operations.
