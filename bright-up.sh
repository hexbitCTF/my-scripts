#!/bin/sh

# 1. Lock to prevent race conditions
exec 200>/tmp/bright-up.lock
flock -n 200 || exit 0

# 2. Get the Max value and calculate 5% of it
MAX=$(light -M | cut -d. -f1)
STEP=$((MAX / 20))

# 3. Get current value as integer
CUR=$(light -G | cut -d. -f1)

# 4. Calculate new value
NEW=$((CUR + STEP))

# 5. Ceiling logic: don't exceed MAX
if [ "$NEW" -gt "$MAX" ]; then
    NEW=$MAX
fi

# 6. Set the value absolutely (no relative math drift)
light -S "$NEW"

# 7. Refresh status bar
pkill -USR1 slstatus
