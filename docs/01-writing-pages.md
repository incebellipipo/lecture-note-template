# 1. Writing pages

## One file, one page

Every markdown file in `docs/` becomes a page. `docs/index.md` is the front page at `/`; every other file is served at `/<basename>/`, with any leading number kept:

| File | URL |
| - | - |
| `docs/index.md` | `/` |
| `docs/00-getting-started.md` | `/00-getting-started/` |
| `docs/guides/deploying.md` | `/deploying/` |

The permalink uses only the basename, so two files with the same name in different folders would collide. Keep basenames unique.

## No front matter needed

Pages carry no YAML header. `jekyll-optional-front-matter` adds one at build time, the `defaults` in `_config.yml` apply the `doc` layout, and `jekyll-titles-from-headings` takes the page title from the first `#` heading. The result is a file that reads the same in a repository browser and on the site.

You can still add front matter to a page when you want to override something:

```yaml
---
title: A title that differs from the heading
permalink: /custom-path/
---
```

## Numbering and order

The site has no generated sidebar, so the contents list in `docs/index.md` *is* the table of contents: it decides what the reader sees and in what order. Numbered filenames keep that order visible in the directory listing too, and each page ends with a link to the next one:

```markdown
Next: [Formatting reference](02-formatting.md)
```

Renumbering means renaming files and updating links, so leave gaps (`10-`, `20-`) if you expect to insert pages later.

## Links between pages

Link to the markdown file, not the URL:

```markdown
See [Customising](03-customising.md) and [its styling section](03-customising.md#styling).
```

`jekyll-relative-links` rewrites these to site URLs when it builds, and GitHub follows them as file links. Prefix links to your own assets with `relative_url` so they survive the `baseurl`:

{% raw %}
```liquid
[the diagram]({{ "/assets/img/diagram.svg" | relative_url }})
```
{% endraw %}

## Headings

Start each page with a single `#` heading — it becomes the page title and the `<h1>` — and use `##` and `###` below it. Kramdown gives every heading an `id`, so `02-formatting.md#maths` works without any extra markup.

Next: [Formatting reference](02-formatting.md)
