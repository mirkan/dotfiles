#
# ~/.bashrc
#

#If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Include aliases
[[ -f $HOME/.alias ]] && source $HOME/.alias

# Autojump
[[ -f /etc/profile.d/autojump.bash ]] && source /etc/profile.d/autojump.bash

# Prompt style
PS1='\[\e[0;31m\]\u\[\e[m\]@\h \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0m\] '

# DISPLAY
#command screenfetch -c 34,255
#command todo.sh list @todo | head -n -2
#command echo "----------------------"
command fortune -s
