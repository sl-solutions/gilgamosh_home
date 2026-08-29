# AGENTS.md

This repository is the source for the `gilgamosh_home` site. Keep changes aligned with what is already here.

## Source Of Truth

- Framework: Hugo
- CSS pipeline: Tailwind CSS, built with the `tailwindcss` CLI from `package.json`
- Main template: `layouts/index.html`
- Tailwind source: `assets/css/input.css`
- Generated CSS: `static/css/tailwind.css`
- Static assets: `static/`
- Local build output: `public/`
- nginx deploy build script: `scripts/build-nginx.sh`

Do not replace Hugo, Tailwind, or the current static-site flow unless the user explicitly asks for a stack change.

## Design Choices

These choices are already present in the repo and should be preserved unless the user asks for a redesign:

- The site is a minimal single-page landing page.
- The visual direction is dark and high-contrast, with a black background and warm orange/ember accents.
- The page is logo-first, with the logo centered and the content kept intentionally sparse.
- Typography uses `Cinzel` for the main display text.
- Motion is subtle and atmospheric, using ember/spark effects rather than heavy animation.

When editing the design:

- Preserve the dark fantasy / ember visual direction already encoded in `layouts/index.html`.
- Prefer small, intentional refinements over adding new sections or generic marketing-site patterns.
- Keep mobile behavior intact; the current template already includes small-screen adjustments.

## Tooling

Verified commands from `package.json`:

- `npm install`
- `npm run build`
- `npm run build:css`
- `npm run dev:css`
- `npm run build:nginx`

Build behavior:

- `npm run build` compiles Tailwind CSS and runs Hugo into `public/`.
- `npm run build:nginx` runs `scripts/build-nginx.sh`.
- `scripts/build-nginx.sh` builds into `/var/www/gilgamosh/public` by default.
- Hugo must already be installed on the machine; it is not installed by `npm`.

Do not add extra build tools, bundlers, or frameworks unless they are clearly needed and explicitly requested.

## Workflow

- Treat `public/` and generated CSS as build artifacts derived from source.
- Make source changes in `layouts/`, `assets/`, `static/`, and config files, then rebuild.
- For local validation, use `npm run build`.
- For nginx deployment on this machine, use `npm run build:nginx`.

Branch workflow requested by the user:

- Do not push directly to `main`.
- Use a feature branch and open a pull request for changes intended for `main`.

Current limitation verified on GitHub on 2026-08-28:

- The repository is private.
- GitHub branch protection / rulesets could not be enabled because the account/repo plan does not allow that feature for this private repo.
- Until that changes, PR-only is a team rule documented here, not a GitHub-enforced rule.

## Known Repo Facts

- `config.toml` currently disables Hugo `404` generation via `disableKinds`.
- The favicon is served from `/favicon.ico?v=2`.
- The site title is `Gilgamosh`.

Do not invent missing infrastructure, CI, hosting platforms, or review requirements. If something is not in the repo or explicitly stated by the user, treat it as unknown.
