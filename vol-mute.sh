#!/bin/sh

# Toggle all three channels
amixer -q set Master toggle || true
amixer -q set Speaker toggle || true
amixer -q set Headphone toggle || true

# Refresh the screen and status bar
clear
pkill -USR1 slstatus
