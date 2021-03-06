#zmodload zsh/zprof

# Red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS=true
unsetopt correct_all
unsetopt correct
DISABLE_CORRECTION="true"

# Enable VI mode
set -o vi
bindkey -v

# Enable history backward incremental search via CTRL-R
bindkey "^R" history-incremental-search-backward

# Enable history backward incremental search via CTRL-R
bindkey "^F" history-incremental-search-forward

# Antigen for plugins
source ~/.profile
source ~/.antigenrc

# Ignore dupes in history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Automatically quote globs in URL and remote references
__remote_commands=(scp rsync)
autoload -U url-quote-magic
zle -N self-insert url-quote-magic
zstyle -e :urlglobber url-other-schema '[[ $__remote_commands[(i)$words[1]] -le ${#__remote_commands} ]] && reply=("*") || reply=(http https ftp)'

#zprof
chpwd() {
  #echo "<$OLDPWD|$PWD>"
  if [ -n "$TMUX" ]; then
    tmux rename-window ${PWD//*\//}
  fi
}

#precmd() {
#  if [ -n "$TMUX" ]; then
#    tmux rename-window ${PWD//*\//}
#  fi
#}
#
#preexec() {
#  if [ -n "$TMUX" ]; then
#    cmd=$(echo "$1" | awk '{print $1}')
#    tmux rename-window ${PWD//*\//}/${cmd}
#  fi
#}

#f() {
#  #printf "AAAAA \033]2;%s\033\\" "${1:-$TMUX_PANE_TITLE}"
#  #if [ "$PWD" != "$LPWD" ]; then
#  #  LPWD="$PWD"
#  #  tmux rename-window ${PWD//*\//}
#  #fi
#  tmux rename-window $(basename $PWD)
#}
#export PROMPT_COMMAND=f

#export PROMPT_COMMAND
# Set up ssh-agent unless we're on OS X

OS=$(uname)
if [[ "$OS" != "Darwin" ]]; then
  SSH_ENV="$HOME/.ssh/environment"
  function start_agent {
    echo "Initializing new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    #/usr/bin/ssh-add;
  }

  # Source SSH settings, if applicable
  if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
  }
  else
    start_agent;
  fi
fi

eval "$(direnv hook zsh)"

#export PS1=$PS1'$( [ -n $TMUX ] && tmux setenv -g TMUX_PWD_$(tmux display -p "#D" | tr -d %) $PWD && tmux rename-window $(basename $PWD))'
export PS1=$PS1'$( [ -n "$TMUX" ] && tmux rename-window $(basename $(tmux display-message -p -F "#{pane_current_path}")))'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


source ~/.xsh

