#!/bin/sh
feh --bg-fill /home/rlkandela/.local/share/background/among-trees.jpg
setxkbmap es
sxhkd &
exec bspwm
