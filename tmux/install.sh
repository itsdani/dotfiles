#!/bin/bash

if test ! $(which tmux)
then
	sudo pacman -S tmux
fi
