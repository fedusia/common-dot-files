# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

#Set 
export PS1="[\e[94m\u\033[0m@\e[92m\h\e[0m \e[33m\t\033[0m \e[96m\W\033[0m]$ "

#Set environment for go installed from source
export GOPATH=~/work/git/go
export GOROOT=/usr/lib/golang
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

