function update
  pamac upgrade -a
end

function search
  if contains -- -a $argv
    pamac search -a $argv
  else
    pacman -Ss $argv
  end
end

function install
  if pacman -Si $argv &> /dev/null
    sudo pacman -Syu $argv
  else
    update
    pamac build $argv
  end
end

function remove
  sudo pacman -Rsu $argv
end
