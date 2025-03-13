i#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dcd='discord --enable-features=UseOzonePlatform --ozone-platform=wayland >/dev/null 2>&1 &'
PS1='[\u@\h \W]\$ '


#custom alias
alias la='ls -a'
alias ll='ls -l'

#enable auto completion for git
if [ -f /usr/share/git/completion/git-completion.bash ]; then
	. /usr/share/git/completion/git-completion.bash
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

PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='[\u \w${PS1_CMD1}]\n\$'
