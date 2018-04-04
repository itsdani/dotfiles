#!/bin/bash

if test ! $(which nvim)
then
	brew install nvim
fi

if [ ! -d $HOME/.dein ]
then
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | bash -s $HOME/.dein
fi
