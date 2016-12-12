#!/bin/zsh
DIST=$(lsb_release -is)
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export BROWSER="chromium"
#export VAGRANT_HOME="$HOME/vagrant/.vagrant.d/"
export PATH=/usr/local/bin:/home/robin/.bin:$PATH
export EDITOR=vim
export LIBVIRT_DEFAULT_URI="qemu+ssh://robin@gen8/system"
# Set theme
ZSH_THEME="agnoster"

# Source

# Load alias and plugins depending on dist
# Arch
if [[ "$DIST" == 'Arch' ]]; then
	source $HOME/.alias/arch_alias
	plugins=(web-search systemd python git archlinux)
fi
# Ubuntu
if [[ "$DIST" == 'Ubuntu' ]]; then
	source $HOME/.alias/ubuntu_alias
	plugins=(web-search systemd python git ubuntu)
fi

[[ -f "$HOME/.alias/general_alias" ]] && source "$HOME/.alias/general_alias"
[[ -f /usr/lib/z.sh ]] && source "/usr/lib/z.sh"
[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"
[[ -f "$HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "$HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# Examples...
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

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
