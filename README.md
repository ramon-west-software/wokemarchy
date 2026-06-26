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
  - kwallet (password store)
  - kwallet-pam (password manager)
  - kde-cli-tools (cli tools for electron apps to save stuff to kwallet)
  - nvim (text editor)
  - waybar (top bar with time and battery)
  - wlogout (menu for sleep and shutdown and restart)
- flatpaks
  - org.signal.Signal
  - org.chromium.Chromium
  - io.freetubeapp.FreeTube

Change default apps in the following files before running install script
-   /hypr/config/variables.lua
-   /install.sh

*Note that some apps like alacritty (terminal) are hard-coded to the waybar config! 

I stil need to update waybar configs to inject preferred packages.*
