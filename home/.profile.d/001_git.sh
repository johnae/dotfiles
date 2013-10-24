if [[ $RUNNING_SHELL = "bash" ]]; then
  export PS1="$NM[ $HI\u $SI\w$NM $IN"'$(__git_ps1 " (%s)")]\$ '
fi

alias gf='git flow'
alias gitshow="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%Creset' --abbrev-commit"

export GIT_EDITOR='vim'
