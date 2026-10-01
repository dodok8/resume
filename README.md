<!-- <picture>
  <source media="(prefers-color-scheme: dark)" srcset="./cover/page-dark-1.svg">
  <source media="(prefers-color-scheme: light)" srcset="./cover/page-light-1.svg">
  <img src="./cover/page-light-1.svg">
</picture> -->

# résumé

Modern résumé built with Typst

## Dev Environment

- Use VS Code for editor (contains recommended extension and settings).
- Install [mise](https://mise.jdx.dev/) and activate it in your shell.
- Run `mise install` to install the Node.js, pnpm, and Typst versions pinned in `mise.toml`.
- Run `pnpm install --frozen-lockfile` to install development dependencies.
- Install the GitHub CLI (`gh`) and authenticate it for fetching GitHub metadata.
- Run `mise run prebuild` to fetch metadata and icons, then compile with `typst compile resume.typ` or `typst compile portfolio.typ`.
- Run `mise run check` for TypeScript checks.
- Optionally run `mise run hooks:install` to enable the pre-commit hook, which runs checks and prebuild. Cover generation runs only when `cover.typ` exists.

Scripts run directly on Node.js using its built-in TypeScript support. All commands
are managed as mise tasks and run from the repository root; Deno and a separate scripts package are no longer required.
CI uses the same mise configuration and continues deploying the PDFs through GitHub Pages.

## Special Thanks

- [shiftpsh](https://github.com/shiftpsh) for his impressive cv design and the [solved.ac](https://solved.ac) service
- [RanolP](https://github.com/RanolP) for typst template
- [Open Color](https://yeun.github.io/open-color/) for good palette
- [Icones](https://icones.js.org/) for easier icon search
- [Iconify](https://iconify.design/) for icon CDN
- [Typst](https://typst.app/) for awesome markup language
