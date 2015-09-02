alias os="orion server"
alias osd="orion server dev"
alias ot="orion spec"
pj()
{
  curl -sS $* | jq '.'
}
