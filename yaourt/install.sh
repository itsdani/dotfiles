
#!/bin/bash
# add yaourt repo to pacman conf
echo "[archlinuxfr]" >> /etc/pacman.conf
echo "SigLevel = never" >> /etc/pacman.conf
echo "Server = http://repo.archlinux.fr/\$arch" >> /etc/pacman.conf

sudo pacman -S yaourt

