#!/bin/bash
#
# a simple dmenu session script 
#
###

#DMENU='dmenu -i -l 6 -fn -xos4-terminus-medium-r-*--12-*-*-*-*-*-iso10646-1 -nb #00BCD4 -nf black -sb yellow -sf red'
DMENU='dmenu -i -nb #00BCD4 -nf black -sb yellow -sf red'
choice=$(echo -e "Suspend\nShutdown\nReboot\nLogout\nHibernate\nLock" | $DMENU)

case "$choice" in
  Lock) xscreensaver-command -lock && xset dpms force off ;;
  Logout) kill -9 -1 & ;;
  Shutdown) systemctl poweroff -i & ;;
  Reboot) systemctl reboot & ;;
  Suspend) xscreensaver-command -lock && systemctl suspend & ;;
  Hibernate) xscreensaver-command -lock && systemctl hibernate & ;;
esac
