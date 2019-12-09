#!/bin/sh

systemctl hibernate
xinput --disable "DELL08A6:00 06CB:7E92 Touchpad"
slock
xinput --enable "DELL08A6:00 06CB:7E92 Touchpad"
