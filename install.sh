#!/bin/bash

# Mapes, kuras vēlamies "stow-ot"
dotfiles=(
    "hypr"
    "waybar"
    "rofi"
    "wofi"
    "kitty"
    "btop"
    "dunst"
    "fastfetch"
    "yazi"
    "waypaper"
    "wal"
    "nwg-look"
    "discord"
    "spotify"
)

echo "Sāku dotfiles sasaisti..."

for dot in "${dotfiles[@]}"; do
    echo "Stowing: $dot"
    stow "$dot"
done

echo "Viss gatavs!"
