#!/bin/bash

# 1. Show only filenames in dmenu
# -printf "%f\n" prints just the file name without the path
FILE_NAME=$(find -L "$HOME/Music" -type f \( -iname "*.mp3" -o -iname "*.flac" -o -iname "*.wav" -o -iname "*.ogg" -o -iname "*.m4a" -o -iname "*.opus" -o -iname "*.aac" \) -printf "%f\n" | dmenu)

# Exit if nothing was selected
[ -z "$FILE_NAME" ] && exit 0

# 2. Find the actual path of the selected filename
# -name "$FILE_NAME" searches for the file
# -print -quit ensures it stops searching after finding the first match
TARGET=$(find -L "$HOME/Music" -type f -name "$FILE_NAME" -print -quit)

# Play with mpv
mpv --no-video "$TARGET"
