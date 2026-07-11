#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_DIR="${1:-/var/www/gilgamosh/public}"

mkdir -p "$TARGET_DIR"

cd "$ROOT_DIR"
npm run build:css
hugo --destination "$TARGET_DIR" --cleanDestinationDir

printf 'Built site into %s\n' "$TARGET_DIR"
