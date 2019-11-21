#!/bin/sh
# To ensure that all scripts on xinitrc.d are sourced
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

feh --bg-fill /home/rlkandela/.local/share/background/among-trees.jpg
setxkbmap es
sxhkd &
exec bspwm
