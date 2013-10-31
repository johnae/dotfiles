# bash
# No ttyctl, so we need to save and then restore terminal settings
if [[ $RUNNING_SHELL = "bash" ]]; then
vim()
{
    local ret STTYOPTS="$(stty -g)"
    stty -ixon
    command vim "$@"
    ret=$?
    stty "$STTYOPTS"
    return "$ret"
}
elif [[ $RUNNING_SHELL = "zsh" ]]; then
# zsh
vim() STTY=-ixon command vim "$@"
fi
## any other shell and I don't know or care