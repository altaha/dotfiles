## Set TERM (for outside and inside of tmux)
if [[ -z $TMUX ]]; then
    export TERM='xterm-256color'
else
    export TERM='screen-256color'
fi

## Functions
##############
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

agfp () {
    ag $1 | fpp
}


## Colors and Stuff
##############
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch)\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


## Aliases
##########
alias ls='ls -GFh'
alias ll='ls -l'
alias la='ls -al'

alias grp='grep -irn'
alias goh='cd /vagrant/workspace'

alias gco='git checkout'
alias gst='git status'
alias thm='cd ~/projects/thm-dev/THM'


## System Path
##############
export PATH="/usr/local/Cellar:$PATH"

# added by Anaconda3 4.2.0 installer
export PATH="/Users/aaltaha/anaconda/bin:$PATH"
