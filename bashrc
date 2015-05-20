#
# ~/.bashrc
#

#If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Paths
PATH=$PATH:"/home/robin/.todo/:/opt/android-sdk/tools/:/opt/android-sdk/platform-tools/:/home/robin/.bin/"

# Exports
export EDITOR=vim
export SYSTEMD_EDITOR=vim
export VISUAL=vim
export HISTFILESIZE=
export HISTSIZE=
#export PAGER='vimpager'

# Prompt style
PS1='\[\e[0;31m\]\u\[\e[m\]@\h \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0m\] '

#ToDo.txt
alias t='todo.sh -ftd /home/robin/.todo/todo.cfg'
source ~/.todo/todo_completion
#autocomplete for alias 't'
complete -F _todo t
#Default action 't' lists uncompleted tasks
export TODOTXT_DEFAULT_ACTION=ls

# DISPLAY
#command screenfetch -c 34,255
command todo.sh list @todo | head -n -2
command echo "----------------------"
command fortune -s

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Git prompt
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Solarized
if [ -f ~/.bash-git-prompt/gitprompt.sh ]; then
	. ~/.bash-git-prompt/gitprompt.sh
fi
	 
