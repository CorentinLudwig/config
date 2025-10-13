

#!/bin/bash

STATE_FILE="/tmp/sway_autoclick_state"

if [[ -f "$STATE_FILE" ]]; then
    # Stop
    kill "$(cat "$STATE_FILE")"
    rm "$STATE_FILE"
    notify-send "Sway Autoclicker stopped"
else
    # Start in background
    (
        while true; do
            swaymsg seat seat0 cursor press button1
            swaymsg seat seat0 cursor release button1
            sleep 0.5   # adjust click speed
        done
    ) &

    echo $! > "$STATE_FILE"
    notify-send "Sway Autoclicker started"
fi

