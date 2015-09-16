# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export EDITOR=vim

# Set theme
ZSH_THEME="pygmalion"

# Select plugins
plugins=(systemd python git vagrant)

# Source
source $ZSH/oh-my-zsh.sh
source $HOME/.alias
# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"
