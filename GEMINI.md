# Gemini Project Overview: Peeter Laas - Personal Homepage

This directory contains the source code for Peeter Laas's personal academic portfolio and website. It is built using **Jekyll**, a static site generator, and is designed to be hosted on **GitHub Pages**. The site serves as a comprehensive online presence showcasing academic work, research highlights, publications, educational background, and a gallery.

## Technologies Used

*   **Jekyll:** Static site generator (Ruby-based).
*   **GitHub Pages:** Hosting platform.
*   **Markdown:** For content creation (`.md` files).
*   **SCSS (Sass):** For styling, with custom dark mode overrides on top of the `jekyll-theme-hyde` theme (inherited from `pages-themes/slate`).
*   **HTML/CSS/JavaScript:** Standard web technologies for the generated site.

## Directory Structure and Key Files

*   `_config.yml`: The main configuration file for Jekyll. It defines site-wide settings such as title, description, URL, theme (`pages-themes/slate@v0.2.0`), Jekyll plugins, and navigation menu order.
*   `README.md`: Provides a brief overview of the project and a link to the live site.
*   `index.md`: The homepage content written in Markdown, including a welcome message, research highlights, current research focus, latest publications, and teaching information.
*   `current-work.md`, `education.md`, `events-admin.md`, `gallery.md`, `past-work.md`: These Markdown files contain the content for the respective sections of the website.
*   `assets/`: This directory holds static assets for the site.
    *   `assets/CV_2026-02-15.pdf`: The author's CV.
    *   `assets/css/style.scss`: Custom SCSS file that imports the base theme and applies dark mode overrides and other specific styling.
    *   `assets/images/`: Contains various images used throughout the website.

## Usage and Development

This project is a static website. For local development and previewing changes, Jekyll needs to be installed.

**Typical Development Workflow:**

1.  **Install Jekyll (if not already installed):**
    ```bash
    gem install jekyll bundler
    bundle install # From the project root to install dependencies from Gemfile
    ```
2.  **Serve the site locally:**
    ```bash
    bundle exec jekyll serve
    ```
    This command builds the site and serves it on a local server, typically `http://localhost:4000`. Changes to Markdown or SCSS files are usually reloaded automatically.
3.  **Deployment:** The site is designed for GitHub Pages. Pushing changes to the `main` branch (or configured branch) of the GitHub repository will trigger an automatic build and deployment by GitHub Pages.

This `GEMINI.md` provides essential context for understanding and maintaining this personal academic portfolio website.