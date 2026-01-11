#!/usr/bin/env bash
# Simple Linux setup script - installs prerequisites, Homebrew, just, and stow
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Installing system prerequisites..."
sudo apt update
grep -v '^#' "$SCRIPT_DIR/prereqs.txt" | grep -v '^$' | xargs sudo apt install -y

echo ""
echo "==> Installing Homebrew..."
if ! command -v brew &> /dev/null; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

echo ""
echo "==> Installing just and stow..."
brew install just stow

echo ""
echo "==> Setup complete! Next step:"
echo "Run: just"
