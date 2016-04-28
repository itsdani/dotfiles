#!/bin/bash

if test ! $(which nvim)
then
	sudo pacman -S neovim
fi
