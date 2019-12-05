#!/bin/sh
# To ensure that all scripts on xinitrc.d are sourced
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

xinput --disable "DELL08A6:00 06CB:7E92 Touchpad"
feh --bg-fill /home/rlkandela/.local/share/background/among-trees.jpg
slock
xautolock -time 10 -locker slock
xsetroot -cursor_name left_ptr
setxkbmap es
xinput --enable "DELL08A6:00 06CB:7E92 Touchpad"
sxhkd &
exec bspwm
