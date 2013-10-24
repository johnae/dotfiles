## rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash $RUNNING_SHELL)"; fi

DEFAULT_JRUBY_OPTS="--1.9 -J-noverify -Xcompile.invokedynamic=false -J-Dfile.encoding=UTF8 -J-Xms512m -J-Xmx2048m"

## use 32-bit client for much faster startup - see 64-bit below about how it can be just as fast
jruby_32bit()
{
  export JRUBY_OPTS="$DEFAULT_JRUBY_OPTS -J-d32 --client"
}

## this uses the 64-bit version - the opts passed seem to be just as good as using 32-bits client version
jruby_64bit()
{
  export JRUBY_OPTS="$DEFAULT_JRUBY_OPTS -J-XX:+TieredCompilation -J-XX:TieredStopAtLevel=1 -J-XX:+UseCompressedOops --server"
}

jruby_use_drip()
{
  export JAVACMD=`which drip`
  export DRIP_INIT_CLASS=org.jruby.main.DripMain
}

set_jruby_home()
{
  JRUBY_PATH=$(dirname $(dirname `which jruby`))
  #JRUBY_PATH="$HOME/.rbenv/versions/$RBENV_VERSION"
  REALPATH=`readlink -n $JRUBY_PATH`
  if [ -z "$REALPATH" ]; then
    REALPATH=$JRUBY_PATH
  fi
  export JRUBY_HOME=$REALPATH
}


## let's default to the 32-bit version for faster development/spec/whatever times
## nope, we CAN use the 64-bit version and get startup as fast as 32-bit
jruby_64bit

set_torquebox_ruby()
{
  export PATH=`echo $PATH | sed -E 's/^\/.*rbenv\/shims:?//g'`
  export TORQUEBOX_HOME=~/Local/torquebox/torquebox
  export JBOSS_HOME=$TORQUEBOX_HOME/jboss
  export JRUBY_HOME=$TORQUEBOX_HOME/jruby
  export PATH=$JRUBY_HOME/bin:$PATH
}

alias r="rails"
alias rs="rails s thin"
alias b="bundle"
alias be="b exec"
alias bi="b install"
alias bu="b update"
alias spec="be rspec --tty -f d spec/"
