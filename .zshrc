

#
# ~/.zshrc — minimal, sans framework
#

# ─────────────────────────────────────────────
# Interactive only
# ─────────────────────────────────────────────
[[ -o interactive ]] || return

# ─────────────────────────────────────────────
# Aliases (équivalent bash)
# ─────────────────────────────────────────────
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias la='ls -a'
alias ll='ls -a -l'
alias g='git'
alias gits='git status'

alias dcd='discord >/dev/null 2>&1 &'
alias ffx='firefox >/dev/null 2>&1 &'

alias mojitos='/home/eritque/document/fac/mojitos/bin/mojitos'

# ─────────────────────────────────────────────
# Shortcut
# ─────────────────────────────────────────────

hash -d work=~/document/fac/secil
hash -d tmp=~/document/tmp/

# ─────────────────────────────────────────────
# Historique (mieux que bash)
# ─────────────────────────────────────────────
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Recherche dans l'historique avec ↑ ↓
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# ─────────────────────────────────────────────
# Complétion (git, nix, systemctl, ssh, …)
# ─────────────────────────────────────────────
autoload -Uz compinit
compinit

# ─────────────────────────────────────────────
# Correction automatique (optionnelle mais utile)
# ─────────────────────────────────────────────
setopt CORRECT

# ─────────────────────────────────────────────
# Git prompt (équivalent __git_ps1)
# ─────────────────────────────────────────────
autoload -Uz vcs_info

# Calcul de l'état du repo (important)
zstyle ':vcs_info:git:*' check-for-changes true

# Symboles
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '*'

# Upstream (équivalent |u=)
zstyle ':vcs_info:git:*' get-revision true
zstyle ':vcs_info:git:*' check-for-changes true

# Formats
zstyle ':vcs_info:git:*' formats ' (%b%u%c)'
zstyle ':vcs_info:git:*' actionformats ' (%b|%a%u%c)'


precmd() {
  vcs_info
}

# ─────────────────────────────────────────────
# Nix shell indicator
# ─────────────────────────────────────────────
prompt_nix() {
  if [[ -n "$IN_NIX_SHELL" ]]; then
    local name="${NIX_SHELL_NAME:-${PWD:t}}"
    echo "(nix:${name}) "
  fi
}

# ─────────────────────────────────────────────
# Prompt final
# ─────────────────────────────────────────────
setopt PROMPT_SUBST

PROMPT='$(prompt_nix)[%n@%m %~${vcs_info_msg_0_}]
$ '

