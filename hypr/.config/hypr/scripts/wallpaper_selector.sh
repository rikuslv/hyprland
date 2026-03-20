#!/bin/bash

# Nosakām mapi
if [ -d "$HOME/wallpapers" ]; then
    WALL_DIR="$HOME/wallpapers"
elif [ -d "$HOME/Pictures/wallpapers" ]; then
    WALL_DIR="$HOME/Pictures/wallpapers"
else
    notify-send "Kļūda" "Mape netika atrasta!"
    exit 1
fi

# Uzģenerējam sarakstu formātā: vārds\0icon\x1fceļš
LIST=""
while IFS= read -r file; do
    # Izveidojam pilno ceļu un pievienojam sarakstam
    LIST+="${file}\0icon\x1f${WALL_DIR}/${file}\n"
done < <(ls "$WALL_DIR" | grep -E "\.(jpg|jpeg|png|webp|gif)$")

# Palaižam Rofi. -dmenu režīmā svarīgi padot sarakstu ar echo -en
SELECTED=$(echo -en "$LIST" | rofi -dmenu -i -p "Select Wallpaper" -theme ~/.config/rofi/wallpaper-launcher.rasi)

if [ ! -z "$SELECTED" ]; then
    swww img "$WALL_DIR/$SELECTED" --transition-type center
    notify-send "Wallpaper Changed" "$SELECTED"
fi
