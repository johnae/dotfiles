OS=`uname`
if [[ "$OS" != "Darwin" ]]; then
  if [[ "$TERM" != "screen" ]]; then
    if [[ ! -z "$SSH_TTY" ]]; then
      echo "Inside ssh, auth sock is $SSH_AUTH_SOCK"
      if [[ -z "$SSH_AUTH_SOCK" ]]; then
        echo "Auth socket is $SSH_AUTH_SOCK, linking..."
        rm "~/.ssh/.wrap_auth_sock"
        ln -sf "$SSH_AUTH_SOCK" "~/.ssh/.wrap_auth_sock"
      fi
      export SSH_AUTH_SOCK="~/.ssh/.wrap_auth_sock"
    fi
    WHOAMI=$(whoami)
    if tmux has-session -t $WHOAMI 2>/dev/null; then
      tmux -2 attach-session -t $WHOAMI
    else
      tmux -2 new-session -s $WHOAMI
    fi
  fi
fi
