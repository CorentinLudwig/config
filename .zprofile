# Si on est sur le TTY1 et que Sway n'est pas déjà lancé
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec sway
fi


export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
