# Run X at login if no X server is started
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# MPD daemon start (if no other user instance exists)
# [ ! -s ~/.mpd/pid ] && mpd ~/.mpd/mpd.conf
