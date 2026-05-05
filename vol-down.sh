#!/bin/sh
LOCKFILE="/tmp/vol_lock"
DELAY_MS=50

now=$(($(date +%s)*1000 + $(date +%N)/1000000))
[ -f "$LOCKFILE" ] && last=$(cat "$LOCKFILE") || last=0
[ $((now - last)) -lt "$DELAY_MS" ] && exit 0
echo "$now" > "$LOCKFILE"

# Decrease by 2% using Mapped scaling
amixer -q -M set Master 2%-

# Update the bar
pkill -RTMIN+12 dwmblocks
