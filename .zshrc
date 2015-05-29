# Path to your oh-my-zsh installation.
export ZSH=/home/infy/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fuckingshit"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo)

# Bash style tab-completion.
setopt autolist
unsetopt menucomplete
zstyle ':completion:::*:default' menu no select

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/lampp/bin:/opt/lampp/bin"
source $ZSH/oh-my-zsh.sh
export EDITOR='vim'
# fix path for php
PATH=$PATH:/opt/lampp/bin

alias wwwstart='sudo /opt/lampp/lampp start'
alias wwwstop='sudo /opt/lampp/lampp stop'
alias lag2='ping webmail.carnet.hr'
alias lag='ping 172.29.33.225' # NEW!
alias DATA='cd /media/DATA'
alias router='ping 192.168.1.1'
alias vncstart='x11vnc -nopw -accept popup:0 -once -viewonly -rfbport 55641'
alias htdocs='cd /opt/lampp/htdocs'
alias cmus='cd /media/DATA/Music; /usr/bin/cmus'
alias untar='tar -xvf'
alias osu='WINEPREFIX=$HOME/.wineosu pasuspender -- wine osu\!.exe'

# Fix mswin keybindings in vim
vim()
{
    local ret STTYOPTS="$(stty -g)"
    stty -ixon
    command vim "$@"
    ret=$?
    stty "$STTYOPTS"
    return "$ret"
}

# zsh
vim() STTY=-ixon command vim "$@"
