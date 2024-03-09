#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#stty -ixon

# unlimit stacksize for large aray in user mode
#ulimit -s unlimited

alias sv='serverkit'
alias serverkit='/home/hiroyuki/.local/share/gem/ruby/3.0.0/bin/serverkit'

alias ls='ls -F --color=auto'
alias ll='ls -la --color=auto'
alias la='ls -a --color=auto'
alias eng='LANG=C LANGUAGE=C LC_ALL=C'
alias brew='/home/linuxbrew/.linuxbrew/bin/brew'
alias d='cd ~/github/dotfilesv'
alias le='leafpad'
alias gd='git diff'
alias gc='git commit'
alias gp='git push'
alias gpu='git pull'
alias gs='git status'
alias ga='git add'
alias gl='git log'
alias glp='git log -p'
alias cls='clear'
alias ww='source .bashrc'

# arch linux
alias sea='sudo pacman -Ss'
alias ss='packer -Ss'
alias a='sudo pacman -S'
alias bb='sudo pacman -Syu'
alias i='pacman -Si'
alias q='pacman -Qi'
alias l='pacman -Ql'
alias r='sudo pacman -Rsn'
alias vi='vim'
alias ..='cd ..'
alias list='pacman -Qqe > pkglist'
alias c='sudo pacman -Sc'

# user file-creation mask
umask 022

PS1="[\\[\\033[31m\]\u \W\[\033[0m\]]\\$ "

setxkbmap -option apple:badmap -layout jp

# serverkit
export PATH="root/.local/share/gem/ruby/3.0.0/bin:$PATH"

# ansible
export PATH=$PATH:$HOME/.local/bin

xmodmap ~/.Xmodmap
