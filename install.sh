#!/usr/bin/env bash
set -euo pipefail

# Install oh-my-bash, only if absent
if [[ ! -f "$HOME/.oh-my-bash/oh-my-bash.sh" ]]; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended
fi

# Clone this repo, idempotently
if [[ ! -d "$HOME/.bash/.git" ]]; then
    git clone --depth 1 https://github.com/gdv/bash.git "$HOME/.bash"
fi

# Point ~/.bashrc at the repo copy
ln -sfn "$HOME/.bash/bashrc" "$HOME/.bashrc"

# Expose aliases to oh-my-bash ($OSH/custom/*.sh are sourced at startup)
mkdir -p "$HOME/.local/bin" "$HOME/.oh-my-bash/custom"
shopt -s nullglob
for p in "$HOME"/.bash/aliases/*.sh; do
    ln -sfn "$p" "$HOME/.oh-my-bash/custom/"
done



