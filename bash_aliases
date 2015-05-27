# .alias
# Aliases and exports

## Paths
PATH=$PATH:"/home/robin/.todo/:/opt/android-sdk/tools/:/opt/android-sdk/platform-tools/:/home/robin/.bin/"

## Exports
export EDITOR=vim
export SYSTEMD_EDITOR=vim
export VISUAL=vim
export HISTFILESIZE=
export HISTSIZE=
#export PAGER='vimpager'

## Aliases
# Git
alias ga='git add'
alias gc='git commit'
alias gs='git status'
alias gd='git diff'
alias gco='git checkout'
alias gpush='git push'
alias gpull='git pull'

## Modified commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias dmesg='dmesg -HL'
alias less=$PAGER

alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep'         		# requires an argument
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias ..='cd ..' 

## Privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudoedit'
    alias root='sudo -s'
    alias reboot='sudo systemctl reboot'
    alias poweroff='sudo systemctl poweroff'
    alias update='sudo pacman -Su'
    alias netctl='sudo netctl'
    alias systemctl='sudo systemctl'
fi

## ps
alias psc='ps xawf -eo pid,user,cgroup,args'
alias errors="sudo journalctl -p 0..3 -xn"

## ls 
alias ll='ls -l'
alias la='ll -lah'
alias lz='ll -rS'                   			# sort by size
#alias ls='ls -hF --color=auto'
#alias lr='ls -R'                    			# recursive ls
#alias lx='ll -BX'                   			# sort by extension
#alias lt='ll -rt'                   			# sort by date
#alias lm='la | more'

## Safety features ## {{{
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    			# 'rm -i' prompts for every file
#alias rm=' timeout 3 rm -Iv --one-file-system'	# safer alternative w/ timeout, not stored in history
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cls=' echo -ne "\033c"'       			# clear screen for real (it does not work in Terminology)

## Pacman 
alias pacman='sudo pacman'
alias pac="sudo /usr/bin/pacman -S"				# default action	- install one or more packages
alias pacu="sudo /usr/bin/pacman -Syu"			# '[u]pdate'		- upgrade all packages to their newest version
alias pacr="sudo /usr/bin/pacman -Rs"			# '[r]emove'		- uninstall one or more packages
alias pacs="/usr/bin/pacman -Ss"				# '[s]earch'		- search for a package using one or more keywords
alias paci="/usr/bin/pacman -Si"				# '[i]nfo'		- show information about a package
alias paclo="/usr/bin/pacman -Qdt"				# '[l]ist [o]rphans'	- list all packages which are orphaned
alias pacc="sudo /usr/bin/pacman -Scc"			# '[c]lean cache'	- delete all not currently installed package files
alias paclf="/usr/bin/pacman -Ql"				# '[l]ist [f]iles'	- list all files installed by a given package
alias pacexpl="/usr/bin/pacman -D --asexp"		# 'mark as [expl]icit'	- mark one or more packages as explicitly installed 
alias pacimpl="/usr/bin/pacman -D --asdep"		# 'mark as [impl]icit'	- mark one or more packages as non explicitly installed
# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rs \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"

# ToDo.txt
if [ -d "$HOME/.todo" ]; then

	export TODOTXT_DEFAULT_ACTION=ls
	source ~/.todo/todo_completion

	alias t='todo.sh -ftd /home/robin/.todo/todo.cfg'
	#autocomplete for alias 't'
	complete -F _todo t
	#Default action 't' lists uncompleted tasks
fi

# cd and ls in one
cl() {
    if [[ -d "$1" ]]; then
        cd "$1"
        ls
    else
        echo "bash: cl: '$1': Directory not found"
    fi
}

# Start all modules required for VirtualBox
alias modvbox="sudo modprobe vboxdrv;sudo modprobe vboxnetadp;sudo modprobe vboxnetflt;sudo modprobe vboxpci"
alias wakebrix="wol 74:d4:35:69:d2:fe"
alias i3conf="vim /home/robin/.i3/config"
alias python="/usr/bin/python2"
alias showcolors="$HOME/.scripts/print_colorscheme.sh"
#alias veewee="bundle exec veewee"

# bash-git-prompt
if [ -f $HOME/.bash-git-prompt/gitprompt.sh ]; then
	GIT_PROMPT_ONLY_IN_REPO=1
	GIT_PROMPT_THEME=Solarized
	source $HOME/.bash-git-prompt/gitprompt.sh
fi

#vim: set syntax=sh
