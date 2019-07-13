#!/usr/bin/env bash

# this is a crude bash script to easily install suckless's simple terminal

if ! [ -e "st-0.8.2.tar.gz" ]
then
    wget https://dl.suckless.org/st/st-0.8.2.tar.gz
    tar -xvf st-0.8.2.tar.gz
else
    tar -xvf st-0.8.2.tar.gz
fi

if [ -e "config.h" ]; then
	if [ -e "st-0.8.2/config.h" ]; then
		rm st-0.8.2/config.h
		cp config.h st-0.8.2/config.h
	else
		cp config.h st-0.8.2/config.h
	fi
fi

cd st-0.8.2

#nvim config.h
#
#static char *font = "DejaVu Sans Mono for Powerline:style=Book:pixelsize=12:antialias=true:autohint=true";
#static char *font = "Monospace:style=Regular:pixelsize=12:antialias=true:autohint=true";
#
#/* gruvbox's color scheme */
#/* Terminal colors (16 first used in escape sequence) */
#static const char *colorname[] = {
#	"#282828", /* hard contrast: #1d2021 / soft contrast: #32302f */
#	"#cc241d",
#	"#98971a",
#	"#d79921",
#	"#458588",
#	"#b16286",
#	"#689d6a",
#	"#a89984",
#	"#928374",
#	"#fb4934",
#	"#b8bb26",
#	"#fabd2f",
#	"#83a598",
#	"#d3869b",
#	"#8ec07c",
#	"#ebdbb2",
#
#	[255] = 0,
#
#	/* more colors can be added after 255 to use with DefaultXX */
#	"#282828",   /* 256 -> bg */
#	"#ebdbb2",   /* 257 -> fg */
#	"#add8e6", /* 258 -> cursor */
#};
#
#unsigned int defaultfg = 257;
#unsigned int defaultbg = 256;
#static unsigned int defaultcs = 258;
#static unsigned int defaultrcs = 0;

# patch

# Scroll back through terminal output using Shift+{PageUp, PageDown}
if ! [ -e "st-scrollback-0.8.2.diff" ]
then
    wget https://st.suckless.org/patches/scrollback/st-scrollback-0.8.2.diff
    patch -Np1 -i st-scrollback-0.8.2.diff
    #$ nvim config.h
    #Shortcut shortcuts[] = {
    #    ...
    #	{ ShiftMask,            XK_Page_Up,     kscrollup,      {.i = -1} },
    #	{ ShiftMask,            XK_Page_Down,   kscrolldown,    {.i = -1} },
    #};
else
    patch -Np1 -i st-scrollback-0.8.2.diff
fi

# select and copy text to primary buffer with keyboard shortcuts
if ! [ -e "st-keyboard_select-20190207-3be4cf1.diff" ]
then
    wget https://st.suckless.org/patches/keyboard_select/st-keyboard_select-20190207-3be4cf1.diff
    patch -Np1 -i st-keyboard_select-20190207-3be4cf1.diff
    #$ nvim config.h
    #Shortcut shortcuts[] = {
    #	...
    #	{ TERMMOD, XK_Escape, keyboard_select, { 0 } },
    #};
else
    patch -Np1 -i st-keyboard_select-20190207-3be4cf1.diff
fi

# This patch modifies st to work from one CLIPBOARD
if ! [ -e "st-clipboard-0.8.2.diff" ]
then
    wget https://st.suckless.org/patches/clipboard/st-clipboard-0.8.2.diff
    patch -Np1 -i st-clipboard-0.8.2.diff
else
    patch -Np1 -i st-clipboard-0.8.2.diff
fi

# build
#make

# transparancy
#$ cp /usr/share/doc/compton/examples/compton.sample.conf ~/.config/compton.conf
#$ nvim2 ~/.config/compton.conf
#opacity-rule = [
#	"92:class_g = 'st-256color'",
#	"92:class_g = 'Xfce4-terminal'"
#];

# test
#./st &

# install
sudo make clean install

# uninstall
#sudo make uninstall
#rm -f /usr/local/bin/st
#rm -f /usr/local/share/man/man1/st.1
