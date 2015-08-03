#
# ~/.bashrc
#

#If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Paths
PATH=$PATH:"/home/robin/.todo/:/opt/android-sdk/tools/:/opt/android-sdk/platform-tools/:$HOME/.bin/"

# Exports
export EDITOR=vim
export SYSTEMD_EDITOR=vim
export VISUAL=vim
export HISTFILESIZE=
export HISTSIZE=
#export PAGER='vimpager'

# Prompt style
PS1='\[\e[0;31m\]\u\[\e[0;32m\]@\h \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0m\] '

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Git prompt
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Solarized
if [ -f ~/.bash-git-prompt/gitprompt.sh ]; then
	. ~/.bash-git-prompt/gitprompt.sh
fi
	 
