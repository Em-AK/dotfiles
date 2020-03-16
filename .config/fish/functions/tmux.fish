function tnew
  tmux new -s $argv
end

function tach
  tmux attach -t $argv
end

function tlist
  tmux list-sessions $argv
end
