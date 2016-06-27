#alias os="orion server"
alias osd="orion server dev"
alias os="orion spec"
alias oe="orion exec"
pj()
{
  curl -sS $* | jq '.'
}
if command -v nvim >/dev/null 2>&1; then
  alias vim=nvim
fi
