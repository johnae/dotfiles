OS=`uname`
if [[ "$OS" != "Darwin" ]]; then
  if [[ "$TERM" != "screen" ]]; then
    if [[ ! -z "$SSH_TTY" ]]; then
      echo "Inside ssh, auth sock is $SSH_AUTH_SOCK"
      SOCK="/tmp/ssh-agent-$USER-tmux"
      if test $SSH_AUTH_SOCK && [[ "$SSH_AUTH_SOCK" != "$SOCK" ]]; then
        rm -f $SOCK
        chgrp root $SSH_AUTH_SOCK
        ln -sf $SSH_AUTH_SOCK $SOCK
        chgrp root $SOCK
        chmod g+rwx $SOCK
        chmod g+rwx $SSH_AUTH_SOCK
        export SSH_AUTH_SOCK=$SOCK
      fi
      if [[ ! -S "$SSH_AUTH_SOCK" ]]; then
        `ssh-agent -a $SSH_AUTH_SOCK` > /dev/null >&1
        echo $SSH_AGENT_PID > ~/.ssh/.auth_pid
      fi
      if [[ -z $SSH_AGENT_PID ]]; then
        export SSH_AGENT_PID=`cat ~/.ssh/.auth_pid`
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
