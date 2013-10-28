if [[ $RUNNING_SHELL = "bash" ]]; then
  test -e /usr/local/etc/bash_completion.d/git-completion.bash && source /usr/local/etc/bash_completion.d/git-completion.bash
  test -e /usr/local/etc/bash_completion.d/git-extras && source /usr/local/etc/bash_completion.d/git-extras
  test -e /usr/local/etc/bash_completion.d/git-prompt.sh && source /usr/local/etc/bash_completion.d/git-prompt.sh
  test -e /usr/local/etc/bash_completion.d/task_completion.sh && source /usr/local/etc/bash_completion.d/task_completion.sh
fi
## gnu-getopt
which brew 2&>1 >/dev/null && export PATH="$(brew --prefix gnu-getopt)/bin":$PATH
