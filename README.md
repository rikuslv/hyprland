#  My Arch Linux Dotfiles (Hyprland)

This repository contains my personal configurations for a Wayland-based setup on Arch Linux. 
The files are managed using **GNU Stow** to create symbolic links from this folder to `~/.config`.

## How to use on a new machine

If you are setting this up on your desktop or a fresh install, follow these steps:

### 1. Install dependencies
Make sure you have Git and GNU Stow installed:
```bash
sudo pacman -S git stow

### 2. Clone the repository

Clone this repo into your home directory:

git clone [https://github.com/rikuslv/hyprland.git](https://github.com/rikuslv/hyprland.git) ~/dotfiles
cd ~/dotfiles

### 3. Apply configurations

Run the install script to symlink everything:

chmod +x install.sh
./install.sh

### Included Configurations

    Window Manager: Hyprland

    Bar: Waybar (with elegant workspace circles & pink capsules)

    Lockscreen: Hyprlock

    App Launchers: Rofi / Wofi

    Terminal: Kitty

    File Manager: Yazi

    System Monitor: Btop

    Colors: Pywal / Wallust
