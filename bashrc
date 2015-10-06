# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

#Set prompt
export PS1="\e[33m[\D{%d %b %T}]\033[0m \e[94m\u\033[0m@\e[92m\h\e[0m:\e[96m\W\033[0m$ "

#Set environment for go installed from source
export GOPATH=~/work/git/go
export GOROOT=/usr/lib/golang
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# for setting history lenght
HISTSIZE=10000

# Bind arrows up/down for reverse search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

