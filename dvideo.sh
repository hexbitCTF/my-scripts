#!/bin/bash

# 1. Show only filenames
FILE_NAME=$(find -L "$HOME/Videos" -type f \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.avi" -o -iname "*.mov" \) -printf "%f\n" | dmenu)

# Exit if nothing was selected
[ -z "$FILE_NAME" ] && exit 0

# 2. Lookup full path
TARGET=$(find -L "$HOME/Videos" -type f -name "$FILE_NAME" -print -quit)

# Play with mpv
mpv "$TARGET"
