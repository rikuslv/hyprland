#!/bin/bash
# Find files in the home directory (excluding hidden folders) and display them in wofi
selected=$(find ~/ -not -path '*/.*' | wofi --show dmenu --prompt "Search files..." --style ~/.config/wofi/style.css)

# If a file was selected, open it with the default application
if [ -n "$selected" ]; then
    xdg-open "$selected"
fi
