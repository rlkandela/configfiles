#!/bin/bash

# Crontab period
# */5 * * * *

BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 00:30:00 ]] ; then
    /usr/bin/notify-send "low battery" "$BATTINFO"
fi
