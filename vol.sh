#!/bin/sh

case $1 in
    up)   amixer -q -M set Master 2%+ ;;
    down) amixer -q -M set Master 2%- ;;
    mute) amixer -q set Master toggle
          # Toggle LED: 1 if muted, 0 if not
          amixer get Master | grep -q "\[off\]" && L=1 || L=0
          echo "$L" | doas tee /sys/class/leds/input*::scrolllock/brightness >/dev/null 2>&1 ;;
esac

pkill -RTMIN+12 dwmblocks
