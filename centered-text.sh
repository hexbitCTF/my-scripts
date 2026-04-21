#!/bin/sh

tag=$1

case "$tag" in
    0) echo "Home" ;;
    1) echo "Cyber Security" ;;
    2) echo "Development" ;;
    3) echo "Study" ;;
    4) echo "Productivity" ;;
    5) echo "Dark / Deep Web" ;;
    6) echo "Files" ;;
    7) echo "Chat" ;;
    8) echo "Browsing" ;;
    *) echo "Unknown" ;;
esac
