#!/bin/bash

# --- Config ---
MUSIC_DIR="$HOME/Music"
SOCKET="/tmp/mpvsocket"

# 1. Select the file using dmenu
FILE=$(find -L "$MUSIC_DIR" -type f \( -iname "*.mp3" -o -iname "*.flac" -o -iname "*.wav" -o -iname "*.ogg" -o -iname "*.m4a" -o -iname "*.opus" \) -printf "%f\n" | dmenu -i)

# Exit if user hits Escape/nothing is selected
[ -z "$FILE" ] && exit 0

# 2. Cleanup old instances
rm -f "$SOCKET"
killall mpv 2>/dev/null

# 3. Find the full path of the selected file
TARGET=$(find -L "$MUSIC_DIR" -type f -name "$FILE" -print -quit)

# 4. Launch in the Scratchpad
# -t "scratchpad": Sets the window title for the DWM rule to catch
# bash -c "...; bash": Keeps the shell open for interaction after mpv starts
st -t "scratchpad" -e mpv --no-video --input-ipc-server="$SOCKET" "$TARGET"

# 6. Verify success
sleep 0.5
if [ ! -S "$SOCKET" ]; then
    notify-send "Music Error" "mpv failed to start the socket."
fi
