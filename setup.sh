#!/usr/bin/env bash
# Bootstraps a new macOS machine with this dotfiles repo:
# installs Homebrew + required CLI tools, clones fzf-git.sh, and
# symlinks the tracked dotfiles into $HOME. Safe to re-run.
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BREW_PACKAGES=(
  tmux
  starship
  fzf
  zoxide
  thefuck
  eza
  fd
  bat
  lazygit
  tlrc # provides the `tldr` command; the `tldr` formula is deprecated
  neovim
  ripgrep
)

echo "==> Dotfiles directory: $DOTFILES_DIR"

# ---- Homebrew ----
if ! command -v brew >/dev/null 2>&1; then
  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  else
    echo "==> Homebrew not found, installing (you may be prompted for your password)"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

# ---- CLI tools ----
echo "==> Installing packages via Homebrew: ${BREW_PACKAGES[*]}"
brew install "${BREW_PACKAGES[@]}"

# ---- fzf-git.sh (git helper widgets for fzf, sourced from .zshrc) ----
if [ ! -d "$HOME/fzf-git.sh" ]; then
  echo "==> Cloning fzf-git.sh"
  git clone https://github.com/junegunn/fzf-git.sh "$HOME/fzf-git.sh"
else
  echo "==> fzf-git.sh already present, skipping clone"
fi

# ---- Symlink dotfiles ----
link() {
  local src="$1" dest="$2"

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "==> $dest already linked correctly"
    return
  fi

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    local backup="${dest}.bak.$(date +%Y%m%d%H%M%S)"
    echo "==> Backing up existing $dest -> $backup"
    mv "$dest" "$backup"
  fi

  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "==> Linked $dest -> $src"
}

link "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
link "$DOTFILES_DIR/.wezterm.lua" "$HOME/.wezterm.lua"
link "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"

echo "==> Done. Open a new terminal (or run 'exec zsh') to pick up all changes."
echo "==> Neovim will bootstrap its LazyVim plugins automatically on first launch."
