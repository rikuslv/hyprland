#!/bin/bash
# Directory with wallpapers
wal_dir="$HOME/Pictures/wallpapers"

# Select wallpaper using wofi
selected=$(ls "$wal_dir" | wofi --show dmenu --prompt "Select Wallpaper" --style ~/.config/wofi/style.css)

if [ -n "$selected" ]; then
    # Set wallpaper using swww
    swww img "$wal_dir/$selected" --transition-type grow --transition-pos center
    
    # Generate colors from wallpaper using pywal
    wal -i "$wal_dir/$selected"
    
    # Send notification (optional)
    notify-send "Theme updated" "New wallpaper: $selected"
fi
