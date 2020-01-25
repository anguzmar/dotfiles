#!/bin/sh

# Merg .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Start the ssh-agent
eval $(ssh-agent)

# Disable touchpad
#xinput disable "MSFT0001:01 04F3:309E Touchpad"

# Activate Numlock on bootup
numlockx &

# Launch applications on startup
unclutter &
redshift &
flameshot &
dunst &
picom &
xss-lock -- i3lock -e -i /home/angel/media/pictures/black_mesa.png &

# Nvidia stuff
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

exec i3
