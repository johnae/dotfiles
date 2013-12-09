devenv(){
  TMUX=
  for project in $(echo -n $DEV_PROJECTS); do
    tmux ls | grep $project && continue
    tmux set-option default-path $DEVDIR/$project
    tmux new-session -d -s $project -n 'Vim'
    tmux select-window -t $project:1
    tmux send-keys "cd $DEVDIR/$project; vim" 'C-m'
    tmux new-window -t $project:2 -n 'Specs'
    tmux select-window -t $project:2
    tmux send-keys "cd $DEVDIR/$project" 'C-m'
    tmux send-keys 'bundle exec rspec'
    tmux select-window -t $project:1
  done

  if [ ! $(tmux ls | grep servers) ]; then
    cd $HOME
    tmux new-session -d -s servers -n 'Servers'
    tmux select-window -t servers:1
    tmux send-keys "cd $HOME" 'C-m'
  fi

  if [ ! $(tmux ls | grep shell) ]; then
    cd $HOME
    tmux new-session -d -s shell -n 'Shell'
    tmux new-window -t shell:1
    tmux select-window -t shell:1
    tmux send-keys "cd $HOME" 'C-m'
  fi

  first_proj=$(echo $DEV_PROJECTS | awk '{print $1}')
  echo "Attach to $first_proj"
  tmux -2 attach-session -t $first_proj
}
