#!/usr/bin/env bash

# this is a crude bash script to easily install suckless's simple terminal

if [ -e "config.h" ] && [ -e "PKGBUILD" ]
then
  if [ -e "st-0.8.2-2-x86_64.pkg.tar.xz" ]; then
    rm st-0.8.2-2-x86_64.pkg.tar.xz
    makepkg -si
  else
    makepkg -si
  fi
else
  echo "file config.h or PKGBUILD don't exist, installation aborted"
fi
