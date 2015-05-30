OS=`uname`
if [[ "$OS" != "Darwin" ]]; then
  if [[ "$TERM" != "screen" ]]; then
    if [[ $SHLVL != "2" ]]; then
      if tmux has-session 2>/dev/null; then
        #exec tmux -2 attach-session -t $WHOAMI
        exec tmux -2 attach
      else
        SOCK="/tmp/ssh-agent-$USER-tmux"
        if test $SSH_AUTH_SOCK && [[ "$SSH_AUTH_SOCK" != "$SOCK" ]]; then
          rm -f $SOCK
          ln -sf $SSH_AUTH_SOCK $SOCK
          export SSH_AUTH_SOCK=$SOCK
        fi
        #devenv
        tmux -2 new-session -s scratch
      fi
    fi
  fi
fi
