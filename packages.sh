#!/bin/bash

echo "curl nodejs..."
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo bash -
sudo apt-get install -y nodejs

echo "other packages.."
sudo apt-get install -y neofetch \
  fzf \
  ninja-build \ # Needed for nvim and nvchad -->
  gettext \
  cmake \
  unzip \
  curl \
  ripgrep \ # <-- Needed for nvim
  tldr
