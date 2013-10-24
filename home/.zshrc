#zmodload zsh/zprof

# Red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS=true
unsetopt correct_all
unsetopt correct
DISABLE_CORRECTION="true"

# Enable VI mode
set -o vi
bindkey -v

# Antigen for plugins
source ~/.antigenrc
source ~/.profile

#zprof
