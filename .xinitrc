#!/bin/sh
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Some missing env variable
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export BSPWM_SOCKET="/tmp/bspwm-socket"
export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:*.deb=90'
export X_RUNNING=true

# Keyboard layout
#setxkbmap -layout "us,us" -variant "colemak," -option "grp:alt_shift_toggle,grp_led:scroll"
#setxkbmap -layout "us" -variant "colemak"
setxkbmap -option ctrl:swapcaps


# Keyboard repeat rate
xset r rate 200 30

# Load Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Reload font cache.
# (Note: Is this even necessary?)
xset +fp /usr/share/fonts/local
xset fp rehash

# Copy and paste fix
#autocutsel -fork &
#autocutsel -selection PRIMARY -fork &

# Set the cursor
xsetroot -cursor_name left_ptr &

# Set mouse acceleration to 0
# NOTE Probably an obsolete command and no longer working
xset m 0 0

# Run start up programs
numlockx &
nitrogen --restore &
#compton -f &
tint2 &
#conky -p 10 &

sxhkd &

# Start window manager
exec bspwm
