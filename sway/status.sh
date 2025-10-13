# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01) date_formatted=$(date "+%a %F %H:%M")# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date "+%a %d/%m/%Y %H:%M")




volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null | awk '{printf "%.0f%%", $2 * 100}')

# If wpctl fails, fall back to "N/A"
if [ -z "$volume" ]; then
  volume="N/A"
fi

# Emojis and characters for the status bar
# 💎 💻 💡 🔌 ⚡ 📁 \|
echo "$date_formatted | 🔊 $volume"
