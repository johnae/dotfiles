#alias os="orion server"
alias osd="orion server dev"
alias os="orion spec"
alias oe="orion exec"
pj()
{
  curl -sS $* | jq '.'
}
