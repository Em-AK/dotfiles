# set keyboard to french
setxkbmap fr

# set background image
sh ~/.fehbg &

# kill bluetooth
# rfkill block bluetooth

# disable PC speaker beeps
xset -b

## trackpoint
# enable vertical scrolling
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
# enable horizontal scrolling
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

# automount external volumes
udiskie &

# parse .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# reload .zshrc
source ~/.zshrc

# launch i3 window manager
exec i3

# set redshift in action
exec redparis

