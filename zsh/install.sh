if test ! $(which zsh)
then
	sudo pacman -S zsh
fi

CD=$(pwd)

curl -sL git.io/zplug | zsh

cd /tmp

git clone git://github.com/pricco/gnome-terminal-colors-monokai.git
cd gnome-terminal-colors-monokai
./install.sh

cd $CD
