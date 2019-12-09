#!/bin/sh

ls -l /home/rlkandela/.scripts/ | grep sh | awk '{print $9}' | dmenu -l 30 | awk '{printf "/home/rlkandela/.scripts/%s",$1}' | sh
