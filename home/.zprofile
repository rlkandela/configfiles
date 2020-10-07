
# Export TZ for emacs telega.el
TZ='Europe/Madrid'; export TZ

# FIN

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx -- vt1 &> /dev/null
fi
