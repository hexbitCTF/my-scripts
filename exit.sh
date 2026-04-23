#!/bin/bash

# Define the options
options="Reboot\nShutdown\nExit"

# Use dmenu to display options and capture the user's selection
choice=$(echo -e "$options" | dmenu)

# Perform the action based on the user's choice
case "$choice" in
    "Reboot")
        doas reboot
        ;;
    "Shutdown")
        doas poweroff now
        ;;
    "Exit")
	doas pkill dwm && doas ly
        ;;
    *)
        echo "No valid option selected."
        ;;
esac
