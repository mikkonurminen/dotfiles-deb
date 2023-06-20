#!/bin/bash

echo "Upgrading system..."
sudo apt-get -y update && sudo apt-get -y upgrade

echo "Configure git"
git config --global user.name "mikkonurminen"
git config --global user.email "mmnurm@gmail.com"

echo "Install packages"
source ~/dotfiles-deb/packages.sh

echo "Install nvim stable"
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

# Install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo 'Install npm packages'
source ~/dotfiles-deb/npm.sh

echo "Symlink dotfiles"
source ~/dotfiles-deb/symlink.sh
