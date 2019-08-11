#!/bin/sh

# Merg .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Keyring stuff.
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=ssh,secrets,pkcs11)
export SSH_AUTH_SOCK

# Disable touchpad.
xinput disable "SynPS/2 Synaptics TouchPad"

# Activate Numlock on Bootup
numlockx &

# Launch applications on startup.
unclutter &
redshift &
xss-lock -- i3lock -e -i /home/angel/media/pictures/lambda.png &

exec i3
