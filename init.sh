#!/usr/bin/env bash
# init.sh - Set up local dev environment for this repo.
# Run once after cloning: bash init.sh

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── gitleaks ──────────────────────────────────────────────────────────────────
if command -v gitleaks &>/dev/null; then
    echo "[init] gitleaks already installed: $(gitleaks version)"
else
    echo "[init] Installing gitleaks..."
    if command -v brew &>/dev/null; then
        brew install gitleaks
    else
        echo "[init] ERROR: Homebrew not found. Install gitleaks manually: https://github.com/gitleaks/gitleaks"
        exit 1
    fi
fi

# ── git hooks ─────────────────────────────────────────────────────────────────
HOOKS_DIR="$REPO_ROOT/.git/hooks"
SCRIPTS_DIR="$REPO_ROOT/scripts"

echo "[init] Installing git hooks..."

ln -sf "$SCRIPTS_DIR/pre-commit" "$HOOKS_DIR/pre-commit"
echo "[init]   pre-commit -> scripts/pre-commit"

echo "[init] Done."
