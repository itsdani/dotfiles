#!/bin/sh

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

set -e

echo ''

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

write_log_header () {
  local prog=$1

  echo "==============================" >> install.log
  echo "     Installing $prog         " >> install.log
  echo "==============================" >> install.log
}

install () {
  local inst=$1
  local prog=$(basename $(dirname $inst))

  info "installing $prog"

  write_log_header $prog

  ret=$(sh -c $inst >> install.log 2>&1)

  echo -en "\e[1A"
  success "installed $prog"
}

install_dotfiles () {
  info 'installing dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done
}

run_installers () {
  info 'running installers'

  for inst in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name 'install.sh' -not -path '*.git*')
  do
    install $inst
  done
}

sudo pacman -Sy
run_installers
install_dotfiles

printf "${GREEN}"
echo '                                                                                    '
echo '.___ _______    _________________________  .____    .____     ___________________   '
echo '|   |\      \  /   _____/\__    ___/  _  \ |    |   |    |    \_   _____/\______ \  '
echo '|   |/   |   \ \_____  \   |    | /  /_\  \|    |   |    |     |    __)_  |    |  \ '
echo '|   /    |    \/        \  |    |/    |    \    |___|    |___  |        \ |    `   \'
echo '|___\____|__  /_______  /  |____|\____|__  /_______ \_______ \/_______  //_______  /'
echo '            \/        \/                 \/        \/       \/        \/         \/ '
echo '                                                                                    '

env zsh

