#!/bin/sh

find /home/rlkandela/Documents/Libros/ -maxdepth 1 -name "*.pdf" -type f -printf '%f\n' | dmenu -l 30 | awk '{printf "zathura \"/home/rlkandela/Documents/Libros/%s\"",$0}' | sh
