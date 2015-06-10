
if [ -n "$ZSH_VERSION" ]; then
  export RUNNING_SHELL="zsh"
elif [ -n "$BASH_VERSION" ]; then
  export RUNNING_SHELL="bash"
else
  export RUNNING_SHELL="unknown"
fi

test -e /etc/profile.d/rbenv.sh && source /etc/profile

#alias homeshick="source $HOME/.homesick/repos/homeshick/bin/homeshick.sh"

source $HOME/.homesick/repos/homeshick/homeshick.sh

# source it here so certain variables are available early
test -e ~/.secrets && source ~/.secrets 

unset MAILCHECK

PATH=`echo $PATH | sed -e 's/\:\/usr\/local\/bin//g'`

echo $PATH | grep -q -s "/usr/local/bin"
if [ $? -eq 1 ] ; then
  PATH="/usr/local/bin:$PATH"
  export PATH
fi

echo $PATH | grep -q -s "/usr/local/sbin"
if [ $? -eq 1 ] ; then
  PATH="/usr/local/sbin:$PATH"
  export PATH
fi

export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="$HOME/Local/bin:$HOME/Local/sbin:$PATH"

if [[ $RUNNING_SHELL = "bash" ]]; then
  export HISTCONTROL=erasedups
  export HISTSIZE=10000
  shopt -s histappend
fi

## Terminal colours (after installing GNU coreutils)
NM="\[\033[0;38m\]" #means no background and white lines
HI="\[\033[0;37m\]" #change this for letter colors
HII="\[\033[0;31m\]" #change this for letter colors
SI="\[\033[0;33m\]" #this is for the current directory
IN="\[\033[0m\]"

export EDITOR='vim'

if [[ -e /usr/libexec/java_home ]]; then
  ## OS X only
  export USE_JAVA_VERSION=${USE_JAVA_VERSION:-"1.8"}
  export JAVA_HOME=`/usr/libexec/java_home -v $USE_JAVA_VERSION`
fi

## Terminal colours (after installing GNU coreutils)
NM="\[\033[0;38m\]" #means no background and white lines
HI="\[\033[0;37m\]" #change this for letter colors
HII="\[\033[0;31m\]" #change this for letter colors
SI="\[\033[0;33m\]" #this is for the current directory
IN="\[\033[0m\]"


if test -d ~/.profile.d ; then for profile in ~/.profile.d/*.sh ; do if test -x "$profile" ; then . "$profile" ; fi ; done ; unset profile ; fi

## for mosh
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
