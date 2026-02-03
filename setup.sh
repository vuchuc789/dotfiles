#!/usr/bin/env bash

set -e

REPO_URL="https://github.com/vuchuc789/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "📦 Setting up dotfiles with symlinks..."
echo "📁 Backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"
mkdir -p "$HOME/.config"

# Clone or update repo
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "⬇️  Cloning dotfiles repo..."
  git clone "$REPO_URL" "$DOTFILES_DIR"
else
  echo "🔄 Dotfiles repo already exists, pulling latest changes..."
  git -C "$DOTFILES_DIR" pull
fi

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

echo "🧹 Backing up existing configs..."

backup_if_exists "$HOME/.config/kitty"
backup_if_exists "$HOME/.config/nvim"
backup_if_exists "$HOME/.tmux.conf"

echo "🔗 Creating symlinks..."

link "$DOTFILES_DIR/kitty" "$HOME/.config/kitty"
link "$DOTFILES_DIR/neovim" "$HOME/.config/nvim"
link "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

echo "✅ Done!"
echo "📦 Old configs saved in: $BACKUP_DIR"
echo "🚀 Restart your terminal / tmux / nvim to see the magic."
