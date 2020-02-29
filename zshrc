#!/bin/zsh
# Path to your oh-my-zsh installation.
export BROWSER="firefox"
export PATH=/usr/local/bin:/home/robin/.bin:$PATH
export EDITOR=vim
source $HOME/.alias
source <(kubectl completion zsh)
source ~/.kubectl_fzf.plugin.zsh

[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
[[ -f /usr/lib/z.sh ]] && source "/usr/lib/z.sh"
[[ -f "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# oh-my-zsh 
# Set theme
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
plugins=(tmux web-search systemd python git ubuntu kubectl)
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
