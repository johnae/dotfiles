## lwp
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

#### Some aliases
alias latest="ls -tr | tail -1"

## size of current folder and contents
alias fsize="du -h -c ./ | tail -1"

alias cd..="cd .."
alias ..="cd .."

alias brewup='for od in `brew outdated`; do brew install $od; done'
alias listening='lsof -i -P | grep LISTEN | grep "TCP.*:" | sort'
alias conns='lsof -i -P | grep ESTABLISHED | sort'

remove_fp()
{
rm -rf $HOME/Library/Preferences/Macromedia/Flash\ Player/#SharedObjects/*
mkdir -p $HOME/Library/Preferences/Macromedia/Flash\ Player/Logs
echo "" > $HOME/Library/Preferences/Macromedia/Flash\ Player/Logs/flashlog.txt
rm -rf $HOME/Library/Preferences/Macromedia/Flash\ Player/macromedia.com/support/flashplayer/sys/*
}

# Sha1 from string
sha1fromString()
{
  echo -n "$1" | openssl sha1
}

kill_plug_screen()
{
  for PID in `ps ax | grep SCREEN | grep usbserial | grep -v grep | awk '{print $1}'`; do sudo kill -9 $PID; done
}

