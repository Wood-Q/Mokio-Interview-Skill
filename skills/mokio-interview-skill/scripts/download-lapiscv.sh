#!/usr/bin/env bash
# Download and extract LapisCV template for resume rendering.
# Usage: bash download-lapiscv.sh [target_dir]
#   target_dir  — where to extract (default: ./lapis-cv-project)

set -euo pipefail

LAPISCV_VERSION="v2.0.1"
LAPISCV_ZIP="lapis-cv-vscode-${LAPISCV_VERSION}.zip"
LAPISCV_URL="https://github.com/BingyanStudio/LapisCV/releases/download/${LAPISCV_VERSION}/${LAPISCV_ZIP}"
TARGET_DIR="${1:-./lapis-cv-project}"

# ── Check dependencies ──────────────────────────────────────────────
for cmd in curl unzip; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "Error: '$cmd' is required but not installed." >&2
    exit 1
  fi
done

# ── If target already exists, verify it has the expected structure ───
if [ -d "$TARGET_DIR/lapis-cv/styles" ] && [ -d "$TARGET_DIR/lapis-cv/fonts" ]; then
  echo "✅ LapisCV already exists at: $TARGET_DIR"
  echo "   Styles: $TARGET_DIR/lapis-cv/styles/"
  echo "   Fonts:  $TARGET_DIR/lapis-cv/fonts/"
  echo ""
  echo "Place your resume .md file inside $TARGET_DIR/ for correct rendering."
  exit 0
fi

# ── Download ─────────────────────────────────────────────────────────
echo "⬇️  Downloading LapisCV ${LAPISCV_VERSION}..."
TMPFILE="$(mktemp "${TMPDIR:-/tmp}/lapiscv-XXXXXX.zip")"
trap 'rm -f "$TMPFILE"' EXIT

if ! curl -fSL --progress-bar -o "$TMPFILE" "$LAPISCV_URL"; then
  echo "Error: Failed to download from $LAPISCV_URL" >&2
  exit 1
fi

# ── Extract ──────────────────────────────────────────────────────────
echo "📦 Extracting to $TARGET_DIR/..."
mkdir -p "$TARGET_DIR"
unzip -o -q "$TMPFILE" -d "$TARGET_DIR"

# ── Verify ───────────────────────────────────────────────────────────
if [ ! -d "$TARGET_DIR/lapis-cv/styles" ] || [ ! -d "$TARGET_DIR/lapis-cv/fonts" ]; then
  echo "Error: Extracted archive is missing expected directories." >&2
  echo "Expected: $TARGET_DIR/lapis-cv/styles/ and $TARGET_DIR/lapis-cv/fonts/" >&2
  exit 1
fi

echo ""
echo "✅ LapisCV ${LAPISCV_VERSION} installed successfully!"
echo ""
echo "Directory structure:"
echo "  $TARGET_DIR/"
echo "  ├── .vscode/            # VS Code preview settings"
echo "  ├── lapis-cv/"
echo "  │   ├── fonts/          # Icon & text fonts"
echo "  │   └── styles/         # CSS stylesheets"
echo "  ├── template-cn.md      # Chinese template"
echo "  └── template-en.md      # English template"
echo ""
echo "Place your resume .md file inside $TARGET_DIR/ for correct rendering."
echo "Open it in VS Code → Markdown Preview → Print to PDF."
