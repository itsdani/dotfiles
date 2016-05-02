#!/bin/bash

if test ! $(which nvim)
then
	sudo pacman --noconfirm -S neovim
fi
