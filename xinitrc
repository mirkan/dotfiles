#!/bin/sh
# ~/.xinitrc
# Executed by startx (run your window manager from here)

# Disable PC beep bell
xset -b
setxkbmap se -option terminate:ctrl_alt_bksp
# Disable Caps lock
setxkbmap -option caps:none

# Error logpath for i3
#E_i3=$HOME/.i3log-$(date +'%F-%k-%M-%S')

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Merge Xresources

# start a program automatically if
# 1) it is installed on the system
# 2) an (optional) file provided as argument exists on the system
# 3) it is not runing already
#
# Arguments:
#   $1: what should be executed
#   $2: program that should exist (e.g. vim)
#   $3: an optional file (full-path) (e.g. $HOME/.vimrc)
startprog() {
  [[ "x$2" != "x" ]] && ! command -v "$2" &>/dev/null && return
  command -v pidof &>/dev/null && pidof "$2" &>/dev/null && return
  [[ "x$3" != "x" ]] && [ ! -e "$3" ] && return
  eval "$1" &
}

## STARTUPS
# Compton
#xrandr --newmode 2560x1440  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync
#xrandr --newmode "2560x1440"  222.52  2560 2720 2992 3424  1440 1441 1444 1477  -HSync +Vsync
#xrandr --addmode HDMI1 2560x1440
#xrandr --output HDMI1 --set "Broadcast RGB" "Full"
startprog "compton --config ~/.compton.conf -b" compton

# Set and rotate wallpaper every 30min
startprog "$HOME/.bin/wallpaper_rotate" $HOME/.bin/wallpaper_rotate

#startprog "devmon" devmon
#startprog "urxvtd -q -f -o" urxvtd
startprog "xbindkeys" xbindkeys
startprog "redshift -l 55.6050:55.6050" redshift
startprog "syndaemon -t -k -i 1 -d" syndaemon
startprog "unclutter -idle 3" syndaemon
exec i3
