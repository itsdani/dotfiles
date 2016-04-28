#!/bin/sh

sudo pacman -Sy
sudo pacman -S git zsh vim

chsh -s /usr/bin/zsh

git clone https://github.com/doczir/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

#install_dotfiles
