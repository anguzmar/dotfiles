#!/bin/sh
# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Start the ssh-agent
eval $(ssh-agent)

# Enable 144 Hz
xrandr --output DisplayPort-0 --mode 1920x1080 --rate 144

# Launch applications on startup
picom --daemon
numlockx &
unclutter &
redshift &
flameshot &
dunst &
nm-applet &
xrandr --output HDMI-A-1 --auto --left-of HDMI-A-0 &
xss-lock -- i3lock -e -t -i /home/angel/media/pictures/lambda.png &

exec /usr/bin/i3
