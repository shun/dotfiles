export LANG=ja_JP.UTF-8
autoload -Uz colors
colors


# using emacs key bindings
bindkey -e

# config
export LSCOLORS=gxfxcxdxbxegedabagacad
PROMPT="
%{${fg[green]}%}[%{${fg[cyan]}%}%n%{${fg[green]}%}@%{${fg[yellow]}%}%m%{${fg[green]}%}: %~]%{${reset_color}%}
%# "

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# auto completion
autoload -Uz compinit
compinit
 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


setopt print_eight_bit
setopt interactive_comments
setopt share_history
setopt hist_reduce_blanks
setopt extended_glob

## setting for each OS

if [ `uname` = "Darwin" ]; then
	# for Mac
	# The following lines were added by compinstall
	zstyle :compinstall filename '/Users/shun/.zshrc'
	alias ll='ls -laG'
	export LSCOLORS=gxfxcxdxbxegedabagacad
	alias startemacsd="/Applications/Emacs.app/Contents/MacOS/Emacs -nw --daemon"
	alias stopemacsd="emacsclient -e '(kill-emacs)'"
	alias ec="emacsclient"
	alias be="/Applications/Hex\ Fiend.app/Contents/MacOS/Hex\ Fiend"

	export GR=/Volumes/DataDrive/github
elif [ `uname` = "Linux" ]; then
	# for Linux
	alias startemacsd="emacs -nw --daemon"
fi

# alias
alias ga="git add"
alias gs="git status"
alias gc="git commit -m"
alias gp="git push -u"
alias emacsnw="emacs -nw"

# End of lines added by compinstall
