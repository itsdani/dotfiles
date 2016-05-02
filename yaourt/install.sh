#!/bin/bash
if test ! $(which yaourt)
then
	# add yaourt repo to pacman conf
	sudo echo "[archlinuxfr]" >> /etc/pacman.conf
	sudo echo "SigLevel = never" >> /etc/pacman.conf
	sudo echo "Server = http://repo.archlinux.fr/\$arch" >> /etc/pacman.conf

	sudo pacman -Sy
	sudo pacman -S yaourt
fi
