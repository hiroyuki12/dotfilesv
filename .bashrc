# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#stty -ixon

# unlimit stacksize for large aray in user mode
#ulimit -s unlimited

# set aliases
alias sv='~/.gem/ruby/2.6.0/gems/serverkit-0.7.0/bin/serverkit'
alias sva='cd ~/github/dotfilesv/;~/.gem/ruby/2.6.0/gems/serverkit-0.7.0/bin/serverkit apply recipe.yml.erb'
alias rebuild='mkdir ~/github;git clone https://github.com/hiroyuki12/dotfilesv;sh ~/github/dotfilesv/install.sh'
alias ls='ls -F --color=auto'
alias ll='ls -la --color=auto'
alias la='ls -a --color=auto'
alias eng='LANG=C LANGUAGE=C LC_ALL=C'
alias brew='/home/linuxbrew/.linuxbrew/bin/brew'
alias rbenv='/home/linuxbrew/.linuxbrew/bin/rbenv'

alias d='cd /home/hiroyuki/github/dotfilesv'
alias sea='apt-cache search'
alias a='sudo apt-get install'
alias bb='sudo apt-get update;sudo apt-get upgrade -y'
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
alias dot='cd github/dotfilesv'
alias xx='startxfce4'
alias ww='source .bashrc'
alias mk='mkrpmspec'

# user file-creation mask
umask 022

PS1="[\\[\\033[31m\]\u \W\[\033[0m\]]\\$ "

setxkbmap -option apple:badmap -layout jp

export PATH="$HOME/.rbenv/versions/2.7.2/lib/ruby/gems/2.7.0/gems/serverkit-0.7.0/bin:$PATH"
export PATH="$HOME/.rbenv/versions/2.7.2/lib/ruby/gems/2.7.0/gems/rebuild-0.6.1/bin:$PATH"
