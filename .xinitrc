#!/bin/sh

# Merging .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Keyring stuff.
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=ssh,secrets,pkcs11)
export SSH_AUTH_SOCK

# Disable touchpad.
xinput disable "SynPS/2 Synaptics TouchPad"

#export XDG_CURRENT_DESKTOP=Budgie:GNOME
#exec budgie-desktop
exec i3
