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
