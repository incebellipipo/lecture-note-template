# 3. Customising

## Configuration

`_config.yml` holds the whole configuration. The keys worth knowing:

| Key | Effect |
| - | - |
| `title` | the title block at the top of every page, and the `<title>` tag |
| `description` | meta description, via `jekyll-seo-tag` |
| `author` | the line under the title, and the footer |
| `baseurl` | path prefix for local previews; the workflow overrides it on deploy |
| `home_url` | optional; when set, adds a *Home* link to the menu |
| `defaults` | applies the `doc` layout and the `/:basename/` permalinks to `docs` |
| `exclude` | files kept out of the build (`README.md`, `src/`, `tools/`, …) |

Leave `plugins`, `optional_front_matter`, `relative_links` and `titles_from_headings` as they are unless you want front matter back in your pages — they are what makes [front-matter-free pages](01-writing-pages.md#no-front-matter-needed) work.

## Styling

The look is a LaTeX article, after [Gradfolio](https://github.com/jitinnair1/gradfolio) and [LatexJekyll](https://github.com/Hammie217/LatexJekyll). `assets/css/main.scss` is the only file with front matter; it pulls in the partials from `assets/css/_sass`:

```text
variables.scss     fonts, sizes, spacing
themes.scss        the light and dark colour variables
style.scss         page frame, title block, navigation, headings
latex-fonts.scss   the Computer Modern @font-face rules
footer.scss        the footer
docs.scss          tables, code, dropdowns, diagrams
copy.scss          the copy button on code blocks
```

`assets/css/notebook.scss` is a second, small stylesheet: it holds only the copy button, for the [rendered notebooks](05-notebooks.md), which keep JupyterLab's look.

Change colours in `themes.scss`. Each theme defines the same CSS variables — `--bg`, `--ink`, `--muted`, `--link`, `--link-hover` — and the rest of the stylesheet, the Mermaid include and the code colours all read them, so editing those values restyles everything at once.

The theme switch in the corner writes the choice to `localStorage`; with nothing saved, the page follows the operating system's setting. Both the dark `@media` query and the `[data-theme="dark"]` selector need the same values, which is why `docs.scss` defines its code colours in a mixin used twice.

## Fonts

`assets/fonts/cmu` holds the Computer Modern webfonts (roman, bold, italic, bold-italic, typewriter) used by `latex-fonts.scss`. To use a different family, replace the `@font-face` rules there and the font stacks in `variables.scss`; the Mermaid include measures labels in whatever the body font ends up being.

## Layout and includes

`_layouts/doc.html` is the single layout: the theme switch, the title block, the navigation, {% raw %}`{{ content }}`{% endraw %}, the footer, the two includes, and `assets/js/copy-code.js`, which adds a *copy* button to every code block. Edit it to add a sidebar, a search box or your own footer text.

- `_includes/mathjax.html` — the MathJax configuration and script tag
- `_includes/mermaid.html` — finds `mermaid` code blocks, renders them in the theme colours, redraws on a theme change

Both are loaded from a CDN. If you need the site to work offline, vendor those two libraries into `assets/` and point the includes at local copies.

## Extra directories

`src/` is an empty placeholder for code that accompanies the documentation. It is listed in `exclude`, so nothing in it is published. Delete it if your project is documentation only.

`notebooks/` is different: every notebook in it is published as a page. [Notebooks](05-notebooks.md) has the details.

Next: [Publishing](04-publishing.md)
