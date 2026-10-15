# Documentation Template

A small [Jekyll](https://jekyllrb.com/) template for project documentation. Pages are plain markdown in `docs/` with no front matter, so they read well in a repository browser *and* build into a static website with a LaTeX-article look, maths, Mermaid diagrams and a light/dark switch.

It includes:

- one layout and one stylesheet, with light and dark themes driven by CSS variables
- MathJax (`$...$`, `$$...$$`) and Mermaid diagrams, both themed to match the page
- a GitHub Pages workflow that builds and deploys on every push to `main`
- Jupyter notebooks in `notebooks/` published as pages, rendered with nbconvert
- a *copy* button on every code block, on the pages and in the notebooks
- a Docker Compose file for a local preview that builds the site as GitHub Pages does
- example pages that document the template itself, as a starting point to replace

Start from [docs/index.md](docs/index.md), or read it as a website (see below).

## Layout

```text
docs/        your pages (markdown; also the site's pages)
_layouts/    page layout
_includes/   MathJax and Mermaid
assets/      stylesheet (LaTeX-article look), Computer Modern fonts, copy button
notebooks/   optional Jupyter notebooks (each one also a page of the site)
tools/       render_notebooks.sh, which turns the notebooks into pages
llms.txt     index for language models
src/         optional, for accompanying code (not published)
```

## Using it

1. Click *Use this template* on GitHub, or fork or clone the repository.
2. In `_config.yml`, set `title`, `description`, `author` and `baseurl` (`/<your-repository-name>`); `home_url` is optional.
3. Update the copyright line in `LICENSE.md`, or replace the license.
4. Replace the pages in `docs/`, keeping the contents list in `docs/index.md` and `llms.txt` in step.
5. Rewrite this README for your project.

[docs/00-getting-started.md](docs/00-getting-started.md) walks through the same steps in more detail.

## Website

**Preview locally** with Docker:

```bash
docker compose up
# open http://localhost:4000/documentation-template/
```

It builds once (pages, then notebooks) and serves the result; run it again after editing. Without Docker, `bundle install` and `bundle exec jekyll serve` preview the pages with live reload, but not the rendered notebooks.

**Run the notebooks** top to bottom with `make test` (needs `jupyter`).

**Publish** with GitHub Pages: push to `main`, then set *Settings > Pages > Source* to *GitHub Actions*. The workflow in `.github/workflows/pages.yml` builds and deploys the site at `https://<user>.github.io/<repository>/`, or under your custom domain if you have one. Forks work the same way.

The look is after [Gradfolio](https://github.com/jitinnair1/gradfolio) and [LatexJekyll](https://github.com/Hammie217/LatexJekyll).

## License

MIT. See [LICENSE.md](LICENSE.md).
