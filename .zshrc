# using emacs key bindings
bindkey -e

# alias
alias ll='ls -laG'
alias startemacsd="/Applications/Emacs.app/Contents/MacOS/Emacs -nw --daemon"
alias stopemacsd="emacsclient -e '(kill-emacs)'"
alias ec="emacsclient"

# config
export LSCOLORS=gxfxcxdxbxegedabagacad

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/shun/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
