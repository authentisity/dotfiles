#
# ~/.bashrc
#

[[ $- != *i* ]] && return

shopt -s extglob

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Tab completion for juliaup and julia channel selection
[ -f "$HOME/.julia/juliaup/completions/bash.sh" ] && source "$HOME/.julia/juliaup/completions/bash.sh"

fastfetch
