#!/bin/bash

set -e

echo "Upgrading system..."
sudo apt-get -y update && sudo apt-get -y upgrade

echo "Configure git..."

LOCAL_GITCONFIG="$HOME/.gitconfig.local"

# Create ~/.gitconfig.local if it doesn't exist
if [ ! -f "$LOCAL_GITCONFIG" ]; then
  echo "Creating $LOCAL_GITCONFIG for private Git settings..."
  touch "$LOCAL_GITCONFIG"

  # Prompt for private Git settings
  read -p -r "Enter your Git user.name: " GIT_USER_NAME
  read -p -r "Enter your Git user.email: " GIT_USER_EMAIL

  # Store them in the local config file
  git config --file "$LOCAL_GITCONFIG" user.name "$GIT_USER_NAME"
  git config --file "$LOCAL_GITCONFIG" user.email "$GIT_USER_EMAIL"

  echo "Private Git settings saved to $LOCAL_GITCONFIG"
else
  echo "$LOCAL_GITCONFIG already exists. Skipping private setup."
fi

# Ensure ~/.gitconfig includes ~/.gitconfig.local
if ! grep -q "path = $LOCAL_GITCONFIG" "$HOME/.gitconfig" 2>/dev/null; then
  git config --global include.path "$LOCAL_GITCONFIG"
fi

echo "Global Git configuration complete."

echo "Install packages"
source "$HOME/dotfiles-deb/packages.sh"

echo "Install nvim stable"
LATEST_TAG=$(curl -sL https://api.github.com/repos/neovim/neovim/releases/latest | grep "tag_name" | cut -d'"' -f4)
curl -LO "https://github.com/neovim/neovim/releases/download/${LATEST_TAG}/nvim-linux-x86_64.appimage"
chmod u+x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim

echo "Symlink dotfiles"
source "$HOME/dotfiles-deb/symlink.sh"
