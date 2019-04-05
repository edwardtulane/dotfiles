# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
export KEYTIMEOUT=1
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/brausse/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U colors && colors

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U promptinit
promptinit
prompt redhat

#------------------------------
# Variables
#------------------------------
export BROWSER="opera"
export EDITOR="vim"
export PAGER="vimpager"

#-----------------------------
# Dircolors
#-----------------------------
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';

export LS_COLORS

# zmv -  a command for renaming files by means of shell patterns.
autoload -U zmv

# zargs, as an alternative to find -exec and xargs.
autoload -U zargs

# Turn on command substitution in the prompt (and parameter expansion and arithmetic expansion).
setopt promptsubst

# Ignore duplicate in history.
setopt hist_ignore_all_dups hist_ignore_space

# Aliases
alias cp='cp -v'
alias rcp='rsync -va --progress'
alias rmv='rsync -va --progress --remove-source-files'
alias mv='mv -v'
alias rm='rm -v'
alias rmdir='rmdir -v'
alias ln='ln -v'
alias chmod="chmod -c"
alias chown="chown -c"

alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias ls='ls --color=auto --human-readable --classify'
alias l='ls  -l --color=auto --human-readable --classify'
alias ll='ls -l --color=auto --human-readable --classify'
alias la='ls -la --color=auto --human-readable --classify'
alias latr='ls -latr --color=auto --human-readable --classify'
alias lagrep='ls -la --color=auto --human-readable --classify | grep'

alias dstamp='date "+%y%m%d" '

alias tl='tail'
alias tf='tail -f'
alias qs='qsub'
alias qt='qstat -e'
alias v='vim --servername vim' # server name is required for vimtex and zathura
                               # to work properly together
alias vd='vimdiff'
alias vp='vimpager'
alias suvi='sudo vim'

alias ..='cd ..'
alias ...='cd ../..'
alias ...='cd ../../..'
alias ...='cd ../..'

alias ya='yaourt'
alias yasu='yaourt -Syu'
alias yg='yaourt -G'
alias ipy='ipython2'
alias rawview='python2 ~/program/vmimodules/vmimodules/qt/RawViewer.py'

alias startpbs='sudo pbs_server; sudo trqauthd; sudo pbs_mom; sudo pbs_sched'
 
alias nb='ipy notebook --profile=nbserver'

# t aliases
alias t='python /usr/lib/python3.6/site-packages/t.py --task-dir ~/tasks --list tasks --track-time'
alias todo='python /usr/lib/python3.6/site-packages/t.py'

# channel manipulation in mplayer output
alias downmix='mplayer -af extrastereo=0'
alias playleft='mplayer -af channels=2:2:0:1:0:0'

alias th='cd ~/write/thesis; v thesis.tex '
fignore=(\~)

# turn off effin caps lock
# setxkbmap -option ctrl:nocaps
# better yet, remap caps lock to Esc
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
# # this is now handled in the LXQt session configuration
# that didn't seem to work properly
#
# named directories
thesis=~/write/thesis
texdoc=~/doc/man/latex
