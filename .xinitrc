#!/bin/sh

# Merg .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Start the ssh-agent
eval $(ssh-agent)

# Disable touchpad
xinput disable "SynPS/2 Synaptics TouchPad"

# Activate Numlock on bootup
numlockx &

# Launch applications on startup
unclutter &
redshift &
xss-lock -- i3lock -e -i /home/angel/media/pictures/lambda.png &

exec i3
