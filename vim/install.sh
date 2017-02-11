#!/bin/bash

if test ! $(which nvim)
then
	sudo pacman --noconfirm -S neovim
fi

if [ ! -d $HOME/.dein ]
then
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | bash -s $HOME/.dein
fi
