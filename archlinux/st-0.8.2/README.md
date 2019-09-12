# Suckless's Simple Terminal (ST)

**Simple Terminal (ST)** is a light weight terminal emulator develop by team suckless.org that needed to recompile the source code everytime we change some configuration or add / remove some feature. And here I create this crude script to easily install ST in arch linux.

**Extra features:**
* Use color scheme of gruvbox
* Use font of Monospace
* The transparancy enable via compton
* Support scroll up / scroll down
* Support select / copy / paste without using a mouse
* The default copy / paste using clipboard

## Installation

``` shell
# Make folder st-0.8.2 and cd into it
$ mkdir st-0.8.2 && cd $_

# Download the files needed
$ wget https://github.com/kenardes/dotfiles/blob/master/archlinux/st-0.8.2/PKGBUILD
$ wget https://github.com/kenardes/dotfiles/blob/master/archlinux/st-0.8.2/config.h
$ wget https://github.com/kenardes/dotfiles/blob/master/archlinux/st-0.8.2/install.sh

# To install ST
$ sh install.sh   # or ./install.sh

# To run ST
$ st
```

## Shortcuts
* C-S-c        : clipcopy
* C-S-v        : clippaste
* C-S-y        : selpaste => selpaste, overwrite by st-clipboard
* S-Insert     : selpaste => selpaste, overwrite by st-clipboard
* C-S-PageUp   : zoom +
* C-S-PageDown : zoom -
* C-S-Home     : zoom reset
* S-PageUp     : scroll up
* S-PageDown   : scroll down
* **keyboard_select:**
  * C-S-Esc         : keyboard select on in move mode
  * h,j,k,l / arrow : to move cursor
  * !, _, *         : move cursor to the middle of the line/column/screen
  * Backspace, $    : move cursor to the beginning/end of the line
  * PgUp, PgDown    : move cursor to the beginning/end of the column
  * Home, End       : move cursor to the top/bottom left corner of the screen
  * s               : toggle move/selection mode
  * /, ?            : activate input mode and search up/down
  * n, N            : repeat last search, up/down
  * t               : toggle regular/rectangular selection type
  * Return          : quit keyboard_select, keeping the highlight of the selection
  * Escape          : quit keyboard select


### Transparancy via compton
``` shell
# If don't have ~/.config/compton.conf then create it
# Edit compton.conf and add rule to st-256color
$ nvim ~/.config/compton.conf
opacity-rule = [
	"92:class_g = 'st-256color'",
	"92:class_g = 'Xfce4-terminal'"
];

# If transparancy not work try to change the opacity value because not all value do
```

## Reference
* [wiki.archlinux.org](https://wiki.archlinux.org/index.php/St)
* [st.suckless.org](https://st.suckless.org/)
* [list of keysym](https://www.cl.cam.ac.uk/~mgk25/ucs/keysymdef.h)
* [luke's st](https://github.com/LukeSmithxyz/st)
