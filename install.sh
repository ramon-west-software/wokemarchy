#!/bin/bash

set -e

# hypr directories
REPO_HYPR="$HOME/wokemarchy/hypr"
TARGET_HYPR="$HOME/.config/hypr"
BACKUP_HYPR="$HOME/.config/hypr-backup-$(date +%Y%m%d_%H%M%S)"

# waybar directories
REPO_WAYBAR="$HOME/wokemarchy/waybar"
TARGET_WAYBAR="$HOME/.config/waybar"
BACKUP_WAYBAR="$HOME/.config/waybar-backup-$(date +%Y%m%d_%H%M%S)"

# nvim directories
REPO_NVIM="$HOME/wokemarchy/nvim"
TARGET_NVIM="$HOME/.config/nvim"
BACKUP_NVIM="$HOME/.config/nvim-backup-$(date +%Y%m%d_%H%M%S)"

echo "Verifying repository location..."
if [ ! -d REPO_HYPR]; then
  echo "Move the repo to $HOME directory"
fi

# Install dependencies
echo "Installing default packages..."
sudo pacman -S alacritty btop dolphin firefox flatpak fuzzel grim hyprland hyprpaper nvim waybar wlogout
sudo flatpak install org.signal.Signal org.chromium.Chromium io.freetubeapp.FreeTube

echo "Backing up existing hyprland configs..."
if [ -d $TARGET_HYPR ]; then
  mv "$TARGET_HYPR" "$BACKUP_HYPR"
fi

echo "Backing up existing waybar configs..."
if [ -d $TARGET_WAYBAR ]; then
  mv "$TARGET_WAYBAR" "$BACKUP_WAYBAR"
fi

# TODO - handle case where ~/.config/nvim directory is missing...
echo "Backing up existing nvim configs..."
if [ -d $TARGET_NVIM ]; then
  mv "$TARGET_NVIM" "$BACKUP_NVIM"
fi

echo "Linking repo files to /.conf directories..."
ln -sf "$REPO_HYPR" "$TARGET_HYPR"
ln -sf "$REPO_WAYBAR" "$TARGET_WAYBAR"
ln -sf "$REPO_NVIM" "$TARGET_NVIM"

echo "Done!"
