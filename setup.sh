#!/usr/bin/env bash

set -e

REPO_URL="https://github.com/vuchuc789/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "📦 Setting up dotfiles with symlinks..."
echo "📁 Backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"
mkdir -p "$HOME/.config"

# -------------------------
# Helpers
# -------------------------

has() {
  command -v "$1" >/dev/null 2>&1
}

backup_if_exists() {
  local target=$1
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "💾 Backing up $target"
    mv "$target" "$BACKUP_DIR/"
  fi
}

link() {
  local src=$1
  local dest=$2
  echo "🔗 Linking $dest → $src"
  ln -sfn "$src" "$dest"
}

# -------------------------
# Clone or update repo
# -------------------------

if [ ! -d "$DOTFILES_DIR" ]; then
  echo "⬇️  Cloning dotfiles repo..."
  git clone "$REPO_URL" "$DOTFILES_DIR"
else
  echo "🔄 Dotfiles repo already exists, pulling latest changes..."
  git -C "$DOTFILES_DIR" pull
fi

echo "🧹 Backing up existing configs..."

# -------------------------
# Kitty
# -------------------------
if has kitty; then
  echo "🐱 Kitty detected"
  backup_if_exists "$HOME/.config/kitty"
  link "$DOTFILES_DIR/kitty" "$HOME/.config/kitty"
else
  echo "⏭️  Skipping kitty (not installed)"
fi

# -------------------------
# Neovim
# -------------------------
if has nvim; then
  echo "📝 Neovim detected"
  backup_if_exists "$HOME/.config/nvim"
  link "$DOTFILES_DIR/neovim" "$HOME/.config/nvim"
else
  echo "⏭️  Skipping nvim (not installed)"
fi

# -------------------------
# Tmux
# -------------------------
if has tmux; then
  echo "🧵 Tmux detected"
  backup_if_exists "$HOME/.tmux.conf"
  link "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
else
  echo "⏭️  Skipping tmux (not installed)"
fi

# -------------------------

echo "✅ Done!"
echo "📦 Old configs saved in: $BACKUP_DIR"
echo "🚀 Restart your terminal / tmux / nvim to see the magic."
