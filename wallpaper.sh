#!/bin/sh

tag=$1

case "$tag" in
    0) feh --bg-scale "$HOME/Pictures/wallpapers/home.png" ;;                     # Home
    1) feh --bg-scale "$HOME/Pictures/wallpapers/cybersecurity.png" ;;            # Cybersecurity
    2) feh --bg-scale "$HOME/Pictures/wallpapers/development.jpg" ;;              # Development
    3) feh --bg-scale "$HOME/Pictures/wallpapers/studying.jpg" ;;                    # Study
    4) feh --bg-scale "$HOME/Pictures/wallpapers/productivity.jpg" ;;             # Productivity
    5) feh --bg-scale "$HOME/Pictures/wallpapers/darkweb.jpg" ;;                  # Dark Web
    6) feh --bg-scale "$HOME/Pictures/wallpapers/files.jpg" ;;                    # Files
    7) feh --bg-scale "$HOME/Pictures/wallpapers/chat.jpg" ;;                     # Chat
    8) feh --bg-scale "$HOME/Pictures/wallpapers/browsing.jpg" ;;                 # Browsing
    *) ;;  # Default: do nothing
esac
