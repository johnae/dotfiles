if [[ $RUNNING_SHELL = "bash" ]]; then
  export HISTTIMEFORMAT="%h %d %H:%M:%S> "
  export HISTCONTROL=erasedups
  export HISTSIZE=10000
  shopt -s histappend
  #smart handling of multi-line commands
  shopt -s cmdhist
  PROMPT_COMMAND="history -a;history -c; history -r;$PROMPT_COMMAND"
fi