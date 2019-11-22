# Check for an interactive session

[ -z "$PS1" ] && return
export PS1='[\[\033[1;33m\]\u\[\033[0m\]@\h \W]\$ '
#PS1='[\u@\h \W]\$ '
alias ls='ls --color=always'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ll='ls -l -k'
alias l='ls'
alias la='ls -a'
alias lf='ls -d */'
alias li='ls -1'
alias s='cd ..'
alias cd..='cd ..'
alias grep='grep --color=auto'
export EDITOR="vim"
export HISTCONTROL=ignoredups
#export PYTHONDOCS=/usr/share/doc/python2/html/
#export http_proxy="127.0.0.1:8118"
#export HTTP_PROXY=$http_proxy
export DISPLAY=:0.0

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export VISUAL="nano"


