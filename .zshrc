source ~/.zplug/zplug

# Oh-My-Zsh
zplug "plugins/git",   from:oh-my-zsh, if:"which git"
zplug "plugins/archlinux",   from:oh-my-zsh, if:"which pacman"
zplug "plugins/mvn",   from:oh-my-zsh, if:"which mvn"
zplug "plugins/command-not-found",   from:oh-my-zsh

zplug "rupa/z", of:z.sh

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions", of:zsh-autosuggestions.zsh
# zplug "zsh-users/zsh-syntax-highlighting", of:zsh-syntax-highlighting.zsh


# Theme
zplug "themes/robbyrussell", from:oh-my-zsh

if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load --verbose
