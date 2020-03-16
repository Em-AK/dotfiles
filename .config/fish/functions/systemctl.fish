function st
  systemctl status $argv;
end

function start
  sudo systemctl start $argv;
end

function stop
  sudo systemctl stop $argv;
end
