function vi --wraps=vim --description 'alias vi=vim'
  vim $argv
end

function android-studio
  /opt/android-studio/bin/studio.sh < /dev/null &> /dev/null &; disown
end
