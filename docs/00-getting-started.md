# 0. Getting started

## Copy the template

Use *Use this template* on GitHub, or fork or clone the repository. Then delete the example pages in `docs/` and start writing your own.

## Replace the placeholders

Five values name the project. Change them before you publish:

| Where | Key | Placeholder |
| - | - | - |
| `_config.yml` | `title` | `Documentation Template` |
| `_config.yml` | `description` | used by `jekyll-seo-tag` for meta tags |
| `_config.yml` | `author` | `Your Name`, shown under the title and in the footer |
| `_config.yml` | `baseurl` | `/documentation-template`, see below |
| `LICENSE.md` | copyright line | the template is MIT; relicense as you like |

`baseurl` only affects local previews: the deploy workflow passes the real repository path when it builds. Set it to `/<your-repository-name>` so the local URLs match the published ones, or to an empty string if the site will live at the root of a domain.

## Preview locally

With Docker, nothing needs to be installed:

```bash
docker compose up
# open http://localhost:4000/documentation-template/
```

This builds the site once, exactly as GitHub Pages does — Jekyll makes the pages, nbconvert renders the notebooks — and serves the result. After editing, stop it and run it again. `make serve` does the same.

Without Docker, you need Ruby (see `.ruby-version`). For the pages alone, with reload on every edit:

```bash
bundle install
bundle exec jekyll serve --livereload
```

`jekyll serve` does not render the notebooks: their links go to the raw `.ipynb` files. A change to `_config.yml` is the one edit the server does not pick up; restart it.

## Publish

Push to `main`, then set *Settings > Pages > Source* to *GitHub Actions*. The workflow in `.github/workflows/pages.yml` builds the site and deploys it to `https://<user>.github.io/<repository>/`. [Publishing](04-publishing.md) covers the details.

Next: [Writing pages](01-writing-pages.md)
