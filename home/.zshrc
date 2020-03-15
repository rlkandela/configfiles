# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rlkandela/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#export PS1="[\[\e[33m\]\u\[\e[m\]@\[\e[36m\]\h\[\e[m\]] \[\e[32m\]\w\[\e[m\]:\$ "
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
fpath=($fpath "/home/rlkandela/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# Add .local/bin to the path
export PATH="$PATH:/home/rlkandela/.local/bin"

# rustcd
autoload bashcompinit
bashcompinit
export RUST_PROJECTS_DIRECTORY=/home/rlkandela/Documents/Rust/
rustcd(){
	cd $(/usr/bin/exec_rustcd.py "$1")
}
eval "$(register-python-argcomplete rustcd)"
export PATH="$PATH:/home/rlkandela/.cargo/bin"
# end rustcd

# Bash insulter
if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi
# End Bash Insulter

# Set hibernation alias
hibernate(){
	systemctl hibernate
	xinput --disable "DELL08A6:00 06CB:7E92 Touchpad"
	slock
	xinput --enable "DELL08A6:00 06CB:7E92 Touchpad"
}
#alias hibernate="sudo pm-hiberate"
# End hibernation alias

# Set LaTeX
export PATH="$PATH:/opt/texlive/2019/bin/x86_64-linux"
export MANPATH="$MANPATH:/opt/texlive/2019/texmf-dist/doc/man"
export INFOPATH"=$INFOPATH:/opt/texlive/2019/texmf-dist/doc/info"
# End LaTeX

# Start Matlab
#export PATH="/usr/local/MATLAB/R2018b/bin:$PATH"
# End Matlab

# Add Local Scripts to Path
export PATH="$PATH:/home/rlkandela/.scripts"
# End Local Scripts to Path

# vim = nvim
alias vim="nvim"
# End

# Set cpath = copy path to clipboard
alias cpath="pwd | xsel -b -i"
# End

# Add emacs.d/bin to path
export PATH="$PATH:/home/rlkandela/.emacs.d/bin"
# End

# Add function to get wireless headphones mac
wireless_headphones_mac(){
	bluetoothctl devices | grep BeatsStudio | awk '{print $2}'
}
# End
