#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#DEFAULTSESSION=openbox-session

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
#start xbindkeys - custom keyboard shortcuts
xbindkeys
# Start xflux
xflux -l 55.584526 -g 13.054724

# Avoid touchpad tapping while tapping
syndaemon -t -k -i 2 -d

# Unclutter after 3 seconds
unclutter -idle 3 &

exec $1
