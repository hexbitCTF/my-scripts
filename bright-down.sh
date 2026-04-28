#!/bin/sh
exec 200>/tmp/bright_down.lock
flock -n 200 || exit 0

MAX=$(light -M | cut -d. -f1)
STEP=$((MAX / 20))
CUR=$(light -G | cut -d. -f1)
NEW=$((CUR - STEP))
[ "$NEW" -lt "$STEP" ] && NEW=0

light -S "$NEW"

pkill -RTMIN+13 dwmblocks
