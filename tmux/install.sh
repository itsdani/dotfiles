#!/bin/bash

if test ! $(which tmux)
then
	sudo pacman --noconfirm -S tmux
fi
