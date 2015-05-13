#if [ -f /etc/bash_completion ]; then
#	    . /etc/bash_completion
#fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

# ls after cd
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
#cd() { builtin cd "$@" && ls; }
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# fix path for php
PATH=$PATH:/opt/lampp/bin

alias wwwstart='sudo /opt/lampp/lampp start'
alias wwwstop='sudo /opt/lampp/lampp stop'

#alias php='/opt/lampp/bin/php'
alias lag2='ping webmail.carnet.hr'
alias lag='ping 172.29.33.225' # NEW!
alias DATA='cd /media/DATA'
alias router='ping 192.168.1.1'
alias vncstart='x11vnc -nopw -accept popup:0 -once -viewonly -rfbport 55641'
alias htdocs='cd /opt/lampp/htdocs'
alias cmus='cd /media/DATA/Music; /usr/bin/cmus'
alias osu='WINEPREFIX=$HOME/.wineosu pasuspender -- wine osu\!.exe'

# Fix control s for vim save.
stty -ixon
bind 'Control-s: '

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo " *"
}

parse_git_branch() {
                git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)] /"
}
#PS1='${debian_chroot:+($debian_chroot)}\[\e[0;31m\]\u@\h\[\e[0m\] \w \[\e[0;31m\]\$\[\e[0m\] $(parse_git_branch)\[\033[00m\]'
PS1='${debian_chroot:+($debian_chroot)}\[\e[0;31m\]\u@\h\[\e[0m\] \w \[\033[01;35m\]$(parse_git_branch)\[\033[00m\]\[\e[0;31m\]\$\[\e[0m\] '
# PS1='\[\e[0;31m\]\u@\h\[\e[0m\] \w \[\e[0;31m\]\$\[\e[0m\] ';
