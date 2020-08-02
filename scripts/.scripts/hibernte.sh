#!/bin/sh

/usr/bin/systemctl hibernate
/usr/bin/xinput --disable "DELL08A6:00 06CB:7E92 Touchpad"
DISPLAY=:0.0 /usr/local/bin/slock
/usr/bin/xinput --enable "DELL08A6:00 06CB:7E92 Touchpad"
