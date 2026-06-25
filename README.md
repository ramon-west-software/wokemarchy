# An unopinionated hyprland setup

Default keybind configurations require the following packages


- pacman packages
  - alacritty (terminal)
  - bluetui (bluetooth TUI)
  - btop (resource manager TUI)
  - dolphin (File Explorer)
  - firefox (browser)
  - flatpak (utlity to install flatpak packages)
  - fuzzel (application launcher)
  - grim (screenshot tool)
  - hyprland (._.)
  - hyprpaper (wallpaper manager)
  - kwallet
  - kwallet-pam
  - kde-cli-tools
  - nvim (text editor)
  - polkit-gnome (keyring)
  - waybar (top bar with time and battery)
  - wlogout (menu for sleep and shutdown and restart)
- flatpaks
  - org.signal.Signal
  - org.chromium.Chromium
  - io.freetubeapp.FreeTube

Change these in the following files
  /hypr/config/variables.lua
  /install.sh

*Note that some apps like terminal alacritty are hard-coded to the waybar config, I need to update that to inject preferred packages.*
