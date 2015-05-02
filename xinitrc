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

exec $1
