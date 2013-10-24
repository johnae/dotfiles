devenv(){
  for project in $(echo -n $DEV_PROJECTS); do
    tmux ls | grep $project && continue
    tmux set-option default-path $DEVDIR/$project
    tmux new-session -d -s $project
    tmux new-window -t $project:0 -n 'Vim'
    tmux select-window -t $project:0
    tmux send-keys "cd $DEVDIR/$project; vim" 'C-m'
    tmux new-window -t $project:1 -n 'Specs'
    tmux select-window -t $project:1
    tmux send-keys 'bundle exec rspec'
    tmux select-window -t $project:0
  done

  if [ ! $(tmux ls | grep servers) ]; then
    cd $HOME
    tmux new-session -d -s servers
    tmux new-window -t servers:0
    tmux select-window -t servers:0
    tmux send-keys "cd $HOME" 'C-m'
  fi

  if [ ! $(tmux ls | grep shell) ]; then
    cd $HOME
    tmux new-session -d -s shell
    tmux new-window -t shell:0
    tmux select-window -t shell:0
    tmux send-keys "cd $HOME" 'C-m'
  fi

  first_proj=$(echo $DEV_PROJECTS | awk '{print $1}')
  echo "Attach to $first_proj"
  tmux -2 attach-session -t $first_proj
}
