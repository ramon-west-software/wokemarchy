# An unopinionated hyprland setup

Default keybind configurations require the following packages


- pacman packages
  - alacritty
  - btop
  - dolphin
  - firefox
  - flatpak
  - fuzzel
  - grim
  - hyprland
  - hyprpaper
  - nvim
  - waybar
  - wlogout
- flatpaks
  - org.signal.Signal
  - org.chromium.Chromium
  - io.freetubeapp.FreeTube

Change these in the following files
  /hypr/config/variables.lua
  /install.sh

*Note that some apps like terminal alacritty are hard-coded to the waybar config, I need to update that to inject preferred packages.*
