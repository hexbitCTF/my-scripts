#!/bin/bash
# Select a wallpaper from your folder
wall_dir="$HOME/Pictures/wallpapers" # Change to your path
wallpaper=$(ls "$wall_dir" | dmenu)

if [ -n "$wallpaper" ]; then
    full_path="$wall_dir/$wallpaper"
    # Apply immediately
    feh --bg-scale "$full_path"
    # Save to a cache file
    echo "$full_path" > "$HOME/.cache/wallpaper_current"
fi
