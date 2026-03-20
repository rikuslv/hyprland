#!/bin/bash
THEME_DIR="$HOME/.config/waybar/themes"
SELECTED_THEME=$(ls "$THEME_DIR" | rofi -dmenu -i -p "Waybar Theme" -theme ~/.config/rofi/wallpaper-launcher.rasi)
[ -z "$SELECTED_THEME" ] && exit
ln -sf "$THEME_DIR/$SELECTED_THEME/config" "$HOME/.config/waybar/config"
ln -sf "$THEME_DIR/$SELECTED_THEME/style.css" "$HOME/.config/waybar/style.css"
killall waybar
waybar &
notify-send "Waybar Updated" "Switched to $SELECTED_THEME theme"
