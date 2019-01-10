#!/bin/zsh
DIST=$(lsb_release -is)

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export BROWSER="firefox"
export PATH=/usr/local/bin:/home/robin/.bin:$PATH
export EDITOR=vim

# Set theme
ZSH_THEME="agnoster"

# Source

# Ubuntu
source $HOME/.alias/ubuntu_alias
plugins=(web-search systemd python git ubuntu)

[[ -f "$HOME/.alias/general_alias" ]] && source "$HOME/.alias/general_alias"
[[ -f /usr/lib/z.sh ]] && source "/usr/lib/z.sh"
[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Start ssh-agent 
if ! pgrep -u $USER ssh-agent > /dev/null; then
	ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
	eval $(<~/.ssh-agent-thing)
fi

ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
