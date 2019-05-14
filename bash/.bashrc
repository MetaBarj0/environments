alias ls='ls -G --color=auto'
alias ll='ls -liAh'
alias s='cd ..'
alias du='du -hs'
alias df='df -h'
alias pushcd='pushd $(pwd)'

export PS1='[\u@\h \W]\$ '

. .bashrc_find-in
. .bashrc_ssh-auth
