#!/bin/zsh
RELEASE=$(lsb_release -is)
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export BROWSER="firefox"
export VAGRANT_HOME="$HOME/vagrant/.vagrant.d/"
export PATH=$HOME/.bin:/usr/local/bin:/usr/lib/surfraw:$PATH
export EDITOR=vim

# Set theme
ZSH_THEME="agnoster"

# Select plugins
plugins=(web-search systemd python git vagrant archlinux rand-quote)

# Source
[[ -f /usr/lib/z.sh ]] && source "/usr/lib/z.sh"
[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"
[[ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -f "$HOME/.alias/general_alias" ]] && source "$HOME/.alias/general_alias"

# Load alias and plugins depending on dist
# Arch
if [[ $REL -eq 'Arch' ]]; then
	source $HOME/.alias/arch_alias
	plugins=(web-search systemd python git archlinux)
fi
# Ubuntu
if [[ $REL -eq 'Ubuntu' ]]; then
	source $HOME/.alias/ubuntu_alias
	plugins=(web-search systemd python git ubuntu)
fi

# Examples...
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

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
