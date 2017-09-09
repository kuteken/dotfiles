# for osX
export PATH=$PATH:/usr/local/mysql/bin/
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# homebrew cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# anyenv
if [ -d $HOME/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi

# Virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME=$HOME/.virtualenvs
  source /usr/local/bin/virtualenvwrapper.sh
fi

# Git
source $HOME/.git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1

if [ -f $HOME/.git-completion.bash ]; then
  source $HOME/.git-completion.bash
  export PS1='\W \u\[\e[1;34m\]$(__git_ps1 " %s")\[\e[1;0m\]\$ '
fi

# history
HISTSIZE=5000
HISTFILESIZE=5000
HISTCONTROL=ignoreboth
HISTIGNORE=history
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

# alias
alias vi='vim'
alias g='git'
alias be='bundle exec'

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "~/.gvm/bin/gvm-init.sh" ]] && source "~/.gvm/bin/gvm-init.sh"
