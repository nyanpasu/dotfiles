##!/bin/bash
#if [ -d /etc/X11/xinit/xinitrc.d ]; then
#  for f in /etc/X11/xinit/xinitrc.d/*; do
#    [ -x "$f" ] && . "$f"
#  done
#  unset f
#fi

## Some missing env variables
#export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
#export X_RUNNING=true

## Keyboard layout
## (Disable on VM)
#setxkbmap -variant altgr-intl -option compose:rctrl -option ctrl:nocaps

## Keyboard repeat rate
## xset r rate 300 30

## Set mouse acceleration to 0
#xset m 0 0

## Load Xresources
## [[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

## Set cursor
## xsetroot -cursor_name left_ptr &

## Wallpaper
# sh ~/.fehbg

## Other programs
## numlockx &
## dunst &

# echo ----
# xrandr --listproviders
# echo ----
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

# Start window manager
exec herbstluftwm
