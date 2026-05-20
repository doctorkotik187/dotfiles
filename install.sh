#!/bin/bash
set -euo pipefail

echo "Checking for chezmoi..."
if ! command -v chezmoi &> /dev/null; then
    if command -v brew &> /dev/null; then
        echo "Installing chezmoi via Homebrew..."
        brew install chezmoi
    else
        echo "Error: chezmoi is not installed and Homebrew was not found."
        exit 1
    fi
fi

echo "Configuring chezmoi..."
CHEZMOI_CONFIG="$HOME/.config/chezmoi/chezmoi.toml"

if [ ! -f "$CHEZMOI_CONFIG" ]; then
    mkdir -p "$(dirname "$CHEZMOI_CONFIG")"
    echo 'mode = "symlink"' > "$CHEZMOI_CONFIG"
    echo "Created $CHEZMOI_CONFIG with symlink mode."
fi

echo "Applying dotfiles with chezmoi..."
chezmoi apply

echo "Done!"
