#!/bin/bash

echo "curl nodejs..."
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo bash -
sudo apt-get install -y nodejs

echo "other packages.."
sudo apt-get install -y neofetch \
  fzf \
  gettext \
  cmake \
  unzip \
  curl \
  ripgrep \
  tldr \
  libfuse2 \
  python3 \
  python3-venv \
  fd-find

ln -s "$(which fdfind)" ~/.local/bin/fd
