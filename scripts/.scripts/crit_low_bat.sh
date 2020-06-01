#!/bin/bash

# Crontab period
# */5 * * * *

BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 00:10:00 ]] ; then
    sh /home/rlkandela/.scripts/hibernte.sh
fi
