#!/bin/sh
exec 200>/tmp/bright_up.lock
flock -n 200 || exit 0

MAX=$(light -M | cut -d. -f1)
STEP=$((MAX / 20))
CUR=$(light -G | cut -d. -f1)
NEW=$((CUR + STEP))
[ "$NEW" -gt "$MAX" ] && NEW=$MAX

light -S "$NEW"

pkill -RTMIN+13 dwmblocks
