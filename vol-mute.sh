#!/bin/sh

# 1. Toggle audio
amixer -q set Master toggle
amixer -q set Speaker toggle
amixer -q set Headphone toggle

# 2. Sync LED (Inverted Logic)
if amixer get Master | grep -q "\[off\]"; then
    # Audio is Muted -> Force LED ON
    # If '1' didn't work before, try '1' here. If it stayed off, try '0'.
    echo 1 | doas tee /sys/class/leds/platform::mute/brightness >/dev/null 2>&1
else
    # Audio is Unmuted -> Force LED OFF
    echo 0 | doas tee /sys/class/leds/platform::mute/brightness >/dev/null 2>&1
fi

# 3. Update the bar
pkill -RTMIN+12 dwmblocks
