if [[ $RUNNING_SHELL = "bash" ]]; then
  source /usr/local/etc/bash_completion.d/git-completion.bash
  source /usr/local/etc/bash_completion.d/git-extras
  source /usr/local/etc/bash_completion.d/git-prompt.sh
  source /usr/local/etc/bash_completion.d/task_completion.sh
fi
## gnu-getopt
export PATH="$(brew --prefix gnu-getopt)/bin":$PATH
