#!/bin/sh
cat /home/rlkandela/.scripts/emojis.txt | dmenu -l 30 | awk '{printf "%s",$1}' | xsel -i -b
