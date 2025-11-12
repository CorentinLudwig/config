
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

# custom alias
alias la='ls -a'
alias ll='ls -a -l'
alias g='git'

alias dcd='discord >/dev/null 2>&1 &'
alias ffx='firefox >/dev/null 2>&1 &'

# Search backward only for commands starting with what you typed
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# enable auto completion for git
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    . /usr/share/git/completion/git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE="true"
    export GIT_PS1_SHOWUPSTREAM="verbose git"
    export GIT_PS1_DESCRIBE_STYLE="branch"
fi

################ ADD IN THE END ################
if [ -f ~/.git-prompt.sh ]; then
    . ~/.git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE="true"
    export GIT_PS1_SHOWUPSTREAM="verbose git"
    export GIT_PS1_DESCRIBE_STYLE="branch"
    PS1="${PS1/\\\$/\$(__git_ps1 \" (%s)\")\\\$}"
fi

# === Dynamic prompt showing nix shell/flake name ===
update_prompt() {
    local nix_prefix=""
    if [ -n "$IN_NIX_SHELL" ]; then
        # Try to extract a name from NIX_SHELL_NAME (flake) or from the flake path
        local nix_name="${NIX_SHELL_NAME:-}"
        if [ -z "$nix_name" ]; then
            # Try to detect flake directory name (last folder before /dev/null in nix develop)
            nix_name="$(basename "$(pwd)")"
        fi
        nix_prefix="(nix:${nix_name}) "
    fi

    PS1="${nix_prefix}[\u@\h \W$(__git_ps1 ' (%s)')]\$ "
}

PROMPT_COMMAND=update_prompt
