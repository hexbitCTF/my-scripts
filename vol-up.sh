#!/bin/sh
LOCKFILE="/tmp/vol_lock"
DELAY_MS=100 # Adjust this if keys feel too slow

now=$(($(date +%s)*1000 + $(date +%N)/1000000))
[ -f "$LOCKFILE" ] && last=$(cat "$LOCKFILE") || last=0
[ $((now - last)) -lt "$DELAY_MS" ] && exit 0
echo "$now" > "$LOCKFILE"

amixer set Master 5%+ >/dev/null

pkill -RTMIN+12 dwmblocks
