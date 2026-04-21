#!/bin/sh

LOCKFILE="/tmp/vol_lock"
DELAY_MS=200

# Get current timestamp in milliseconds
now=$(($(date +%s)*1000 + $(date +%N)/1000000))

# Get last run time (or default to 0)
[ -f "$LOCKFILE" ] && last=$(cat "$LOCKFILE") || last=0

# Calculate time since last run
diff=$((now - last))

# If not enough time has passed, exit early
if [ "$diff" -lt "$DELAY_MS" ]; then
    exit 0
fi

# Save current time to lockfile
echo "$now" > "$LOCKFILE"

# Adjust volume
/usr/bin/amixer set Master 5%- >/dev/null

# Update slstatus or dwmblocks
/usr/bin/pkill -USR1 slstatus
