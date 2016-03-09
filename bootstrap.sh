#!/bin/sh

pacman -S git zsh vim

chsh -s /usr/bin/zsh

git clone https://github.com/b4b4r07/zplug ~/.zplug

ln -s .zshrc ~/.zshrc
ln -s .vimrc ~/.vimrc

zsh
