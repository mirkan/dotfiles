#!/bin/bash
# ~/.bashrc
#

## Paths
PATH=$PATH:""

## Exports
export EDITOR=vim
export SYSTEMD_EDITOR=vim
export VISUAL=vim
export HISTFILESIZE=
export HISTSIZE=
export PAGER='vimpager'

#If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Include aliases and exports
[[ -f $HOME/.alias/general_alias ]] && "source $HOME/.alias/general_alias"
[[ -f $HOME/.bash_exports ]] && "source $HOME/.bash_exports"

# Autojump
[[ -f /etc/profile.d/autojump.bash ]] && source /etc/profile.d/autojump.bash

# Add dir-colors
#[[ $TERM == "xterm-termite" ]] && eval $(dircolors $HOME/.config/termite/dircolors)

# Prompt style
PS1='\[\e[0;31m\]\u\[\e[m\]@\h \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0m\] '
