#!/usr/bin/env bash

# this is a script to help to install spacemacs

DIR="$HOME/.spacemacs.d"
mkdir -p $DIR

if ! [ -e "$DIR/.spacemacs" ]; then
      if ! [ "$(ls -A $DIR)" ]; then
         git clone https://github.com/syl20bnr/spacemacs.git $DIR/.emacs.d
      fi

      cd $DIR
      wget https://github.com/kenardes/dotfiles/blob/master/archlinux/spacemacs/.spacemacs

      if [ -e "$HOME/.spacemacs" ]; then
         rm $HOME/.spacemacs
      fi
fi

# $ nvim ~/.zshrc
# alias spacemacs="HOME=$HOME/.spacemacs.d emacs"
# restart
