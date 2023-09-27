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
    PS1+=" ${GREEN}\342\234\224 [$EXIT]${RESET} "
  else
    PS1+=" ${RED}\342\234\230 [$EXIT]${RESET} "
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

function __virtualenv_name__(){
  if [[ -n $VIRTUAL_ENV ]]; then
      PS1+="${RED}venv:($(basename $VIRTUAL_ENV))${RESET} "
  fi
}

function __my_prompt__(){
  __error_code__
  __virtualenv_name__
  __working_dir__
  __git_branch_name__
  __prompt__
}

# My prompt
export PROMPT_COMMAND=__my_prompt__

# Set go environment
export GOPATH=~/work
export GOROOT=/usr/local/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# Set default editor to vim
export EDITOR=`which vim`
export DEBFULLNAME="Dmitry Fedorov"
export DEBEMAIL="fedusia@yandex-team.ru"

# set default pager for manual
export MANPAGER=`which most`

# for setting history lenght
HISTSIZE=500000

# Bind arrows up/down for reverse search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Define common aliaces
alias ll='ls -l'
alias dch='dch --distributor=debian'

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
if [[ $(uname -s) == 'Darwin' ]]; then
    PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
fi

# Setting PATH to use binaries from brew
if [ -x "/opt/homebrew/bin/brew" ]; then
    PATH="/opt/homebrew/bin/:${PATH}"
fi

export PATH
