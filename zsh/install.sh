#!/bin/bash

if test ! $(which zsh)
then
	sudo pacman --noconfirm -S zsh
	curl -sL git.io/zplug | zsh
fi

CD=$(pwd)

export ZPLUG_HOME="$HOME/.zplug"
curl -sL zplug.sh/installer | zsh

cd /tmp

if test ! $(which expect)
then
	sudo pacman --noconfirm -S expect
fi

git clone git://github.com/pricco/gnome-terminal-colors-monokai.git
cd gnome-terminal-colors-monokai
$CD/zsh/theme_install
# ./install.sh

cd $CD
