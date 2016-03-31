# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# Define colors
GREEN="\[\033[32m\]"
RED="\[\033[31m\]"
ORANGE="\[\033[33m\]"
LBLUE="\[\033[34m\]"
RESET="\[\033[0m\]"

function __error_code__(){
  local EXIT="$?"
  PS1=""
  if [ $EXIT == 0 ]; then
    PS1+="${GREEN}\342\234\224${RESET} "
  else
    PS1+="${RED}\342\234\230${RESET} "
  fi
}

function __working_dir__(){
  PS1+="${LBLUE}\W${RESET}"
}

function __git_branch_name__() {
  PS1+="${ORANGE}$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')${RESET}"
}

function __prompt__(){
  PS1+="$ "
}

function __my_prompt__(){
  __error_code__
  __working_dir__
  __git_branch_name__
  __prompt__
}

export PROMPT_COMMAND=__my_prompt__

export GOPATH=~/work/git/go
export GOROOT=/usr/lib/golang
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# for setting history lenght
HISTSIZE=50000

# Bind arrows up/down for reverse search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Define aliaces
alias svnenv='cd ~/work/svn/puppet-noginsk/trunk/var/lib/puppet/environments/'
alias gitenv='cd ~/work/git/puppet-getting-started/env/'
alias gitpreprod='cd ~/work/git/puppet-getting-started/hiera/hiera; git co master; git pull'

