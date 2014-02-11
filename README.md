### A miserable hobo's configuration files.

All configs currently used.
I usually use git to keep my partition( particularly between my persistent usb install and main linux distribution ) configs synced and to show people how my configs are written.

Harsh criticism is warmly accepted. (Encouraged, really.)

## Files
#.vimrc
Requires [vundle](www.github.com/gmarik/vundle), which is an amazing package manager that in
turn requires [git](www.github.com)

#.weechat
Assumes you have python+ruby+lua support as well as the iset script installed.

#.zshrc
Realtime config for [Zsh](www.zsh.org/), an alternative to bash. 

Breakdown of what it does:
-Assigns modern keyboard keys (HOME/END/PGUP/PGDOWN etc.)
-Allows you to do bash-like movements (ctrl+<left/right> to move between words)
-Sets up vim as an editor, so you can ^[ to execute vi-like commands *in zsh*
-Enables colours for ```ls``` and ```man```

#.config/bspwm
Tiling window manager I currently use.

Config sets up 5 desktops [1 - 5]

#.config/sxhkd
The hotkey daemon that was pretty much developed alongside bspwm and goes pretty well together.


## Comments
me
>hue
