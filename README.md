# gilgamosh_home

Gilgamosh website built with hugo and tailwindcss

## Requirements

- Node.js 18+ and `npm`
- Hugo installed and available on your `PATH`

Check what you have installed:

```bash
node -v
npm -v
hugo version
```

## Install dependencies

From the project directory:

```bash
npm install
```

This installs the Tailwind CSS build dependency from `package.json`.

## Project structure

- `layouts/index.html` - main landing page template
- `content/_index.md` - homepage copy rendered by Hugo
- `assets/css/input.css` - Tailwind source file
- `static/` - static assets copied into the final site
- `public/` - local Hugo build output
- `scripts/build-nginx.sh` - build script for nginx deployment

## Build the site locally

Run:

```bash
npm run build
```

This does two things:

1. Builds `static/css/tailwind.css`
2. Runs Hugo and writes the site into `public/`

After that, open the generated files from:

```bash
public/
```

## Rebuild only the CSS

```bash
npm run build:css
```

Useful when you only changed styling.

## Watch CSS while editing

```bash
npm run dev:css
```

This keeps Tailwind running in watch mode and updates `static/css/tailwind.css` whenever `assets/css/input.css` changes.

## Build for nginx

To build directly into the nginx-served directory:

```bash
npm run build:nginx
```

By default this writes to:

```bash
/var/www/gilgamosh/public
```

You can also choose a custom destination:

```bash
./scripts/build-nginx.sh /absolute/target/path
```

## Full build flow

If you want the exact deployable flow used in this project:

```bash
# cd into project root
npm install
npm run build:nginx
```

## Notes

- `npm install` does not install Hugo. Hugo must be installed separately on the machine.
- The generated CSS file is minified.
- `public/` can be rebuilt at any time from source files.
