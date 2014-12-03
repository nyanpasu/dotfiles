#!/bin/sh
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Some missing env variables
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export BSPWM_SOCKET="/tmp/bspwm-socket"
export X_RUNNING=true

# Keyboard layout
setxkbmap -option ctrl:swapcaps

# Keyboard repeat rate
xset r rate 200 30

# Load Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Set the cursor
xsetroot -cursor_name left_ptr &

# Run start up programs
eval $(cat ~/.fehbg)
numlockx &
dunst &

# Start window manager
exec herbstluftwm --locked
