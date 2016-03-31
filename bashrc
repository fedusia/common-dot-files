# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

function __git_branch_name__() {
    PS1+=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')
}


function __error_code__(){
  local EXIT="$?"
  PS1=""
  if [ $EXIT == 0 ]; then
    PS1+=";)"
  else
    PS1+=";("
  fi
}

function __my_prompt__(){
  __error_code__
  __git_branch_name__
}
#return_value_visualisation() {
#    exit_code=$?
#    if [ $exit_code == 0 ]
#    then
#        echo ";)"
#    else
#        echo ":("
#    fi
#}
#highlight_exit_code()
#{
#    exit_code=$?
#    if [ $exit_code -ne 0 ]
#    then
#        highlight_error "$exit_code "
#    fi
#}

export PROMPT_COMMAND=__my_prompt__
#Set prompt
#export PS1="$(return_value_visualisation)\[\033[00m\]:\[\033[0;96m\]\W\[\033[00m\]\[\033[33m\]\$(parse_git_branch)\[\033[00m\]$"
##return value visualisation
#export PS1="$(return_value_visualisation):"
#export PS1="\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[0;32m\];)\"; else echo \"\[\033[0;31m\];(\"; fi)\[\033[00m\] : "
#Set environment for go installed from source
export GOPATH=~/work/git/go
export GOROOT=/usr/lib/golang
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# for setting history lenght
HISTSIZE=50000

# Bind arrows up/down for reverse search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

#Environment aliases
alias svnenv='cd ~/work/svn/puppet-noginsk/trunk/var/lib/puppet/environments/'
alias gitenv='cd ~/work/git/puppet-getting-started/env/'
alias gitpreprod='cd ~/work/git/puppet-getting-started/hiera/hiera; git co master; git pull'

