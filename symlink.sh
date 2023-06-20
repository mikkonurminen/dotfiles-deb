#!/bin/bash

echo "Symlink .bashrc"
ln -nfs ~/dotfiles-deb/bashrc/.bashrc ~/.bashrc

echo "Symlink aliases"
mkdir -p ~/.config/aliases
ln -nfs ~/dotfiles-deb/aliases/bash_aliases ~/.config/aliases/bash_aliases

echo "Symlink nvim config"
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles-deb/nvim ~/.config/nvim
