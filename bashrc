# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#Set prompt
export PS1="`if [ $? = 0 ]; then echo "\[\033[01;32m\]✔"; else echo "\[\033[01;31m\]✘"; fi` \[\033[0;94m\]\u\[\033[00m\]@\[\033[0;92m\]\h\[\033[00m\]:\[\033[0;96m\]\w\[\033[00m\]\[\033[33m\]\$(parse_git_branch)\[\033[00m\]$"

export PROMPT_DIRTRIM=3

#Set environment for go installed from source
export GOPATH=~/work/git/go
export GOROOT=/usr/lib/golang
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# for setting history lenght
HISTSIZE=10000

# Bind arrows up/down for reverse search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

#Environment aliases
alias svnenv='cd ~/work/svn/puppet-noginsk/trunk/var/lib/puppet/environments/'
alias gitenv='cd ~/work/git/puppet-getting-started/env/'

