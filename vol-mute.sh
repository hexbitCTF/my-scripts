#!/bin/sh
amixer -q set Master toggle
amixer -q set Speaker toggle
amixer -q set Headphone toggle
pkill -RTMIN+12 dwmblocks
