#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dcd='discord >/dev/null 2>&1 &'
alias ffx='firefox >/dev/null 2>&1 &'
PS1='[\u@\h \W]\$ '


#custom alias
alias la='ls -a'
alias ll='ls -l'
alias g='git'

alias dcd='discord >/dev/null 2>&1 &'
alias ffx='firefox >/dev/null 2>&1 &'


#enable auto completion for git
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    . /usr/share/git/completion/git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE="true"
    export GIT_PS1_SHOWUPSTREAM="verbose git"
    export GIT_PS1_DESCRIBE_STYLE="branch"
fi


################ ADD IN THE END ################
if [ -f ~/.git-prompt.sh ]; then
    . ~/.git-prompt.sh
    # export GIT_PS1_SHOWUNTRACKEDFILES="true"
    export GIT_PS1_SHOWDIRTYSTATE="true"
    export GIT_PS1_SHOWUPSTREAM="verbose git" # name
    export GIT_PS1_DESCRIBE_STYLE="branch"
    # Bash: initially: PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    # better: let us use substring substitution.
    PS1="${PS1/\\\$/\$(__git_ps1 \" (%s)\")\\\$}"
    # alternatively:
    # PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
fi