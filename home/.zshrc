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
source ~/.profile
source ~/.antigenrc

#zprof

# Set up ssh-agent unless we're on OS X

OS=`uname`
if [[ "$OS" != "Darwin" ]]; then
  SSH_ENV="$HOME/.ssh/environment"

  function start_agent {
  echo "Initializing new SSH agent..."
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo succeeded
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
  /usr/bin/ssh-add;
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
