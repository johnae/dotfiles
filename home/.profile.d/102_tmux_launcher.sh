OS=`uname`
if [[ "$OS" != "Darwin" ]]; then
  if [[ "$TERM" != "screen" ]]; then
    if [[ ! -z "$SSH_TTY" ]]; then
      SOCK="/tmp/ssh-agent-$USER-tmux"
      if test $SSH_AUTH_SOCK && [[ "$SSH_AUTH_SOCK" != "$SOCK" ]]; then
        rm -f $SOCK
        ln -sf $SSH_AUTH_SOCK $SOCK
        export SSH_AUTH_SOCK=$SOCK
      fi
    fi
    WHOAMI=$(whoami)
    if tmux has-session -t $WHOAMI 2>/dev/null; then
      tmux -2 attach-session -t $WHOAMI
    else
      tmux -2 new-session -s $WHOAMI
    fi
  fi
fi
