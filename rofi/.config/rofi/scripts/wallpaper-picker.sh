#!/bin/bash

# MAINA ŠO! Norādi savu tapešu mapi
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Rofi tēmas fails
ROFI_THEME="$HOME/.config/rofi/wallpaper.rasi"

# Pārliecināmies, ka mapē ir bildes
if [ ! -d "$WALLPAPER_DIR" ] || [ -z "$(ls -A "$WALLPAPER_DIR")" ]; then
    notify-send "Kļūda" "Tapešu mape ir tukša vai neeksistē: $WALLPAPER_DIR"
    exit 1
fi

# Izmantojam Rofi, lai izvēlētos bildi (rādot sīktēlus kā ikonas)
selected_wallpaper=$(ls "$WALLPAPER_DIR" | rofi -dmenu -theme "$ROFI_THEME" -p "Tapetes" -show-icons -icon-theme "$WALLPAPER_DIR")

# Ja nekas netika izvēlēts (nospiests Esc), izejam
if [ -z "$selected_wallpaper" ]; then
    exit 0
fi

# Uzstādām tapeti ar swww
FULL_PATH="$WALLPAPER_DIR/$selected_wallpaper"
swww img "$FULL_PATH" --transition-type outer --transition-pos 0.85,0.97 --transition-step 90
