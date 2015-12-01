# set keyboard to french
setxkbmap fr

# disable PC speaker beeps
xset -b

# parse .Xresources
xrdb -merge /home/emak/.Xresources
feh  --bg-scale /home/emak/images/reunion.jpg
udiskie &
eval $(ssh-agent)
exec i3
