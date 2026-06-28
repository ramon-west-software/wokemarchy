# An unopinionated hyprland setup

This hyprland quickstart provides a basic setup for hyprland with some default keybind configurations and packages. The install script installs the packages listed below and links the configuration files to the appropriate locations. After install, configuration directories ~/.config/(hypr, waybar, alacritty, etc.) will contain symlinks to the configuration files in this repo.

**Feel free to fork and change the default applications and packages** in the following files to configure to your liking.
-   /hypr/config/variables.lua
-   /install.sh

Do so **before** running /install.sh unless you want my default configuration. Existing configuration files will be moved to `~/.config/hypr-backup-{date-time}` for easy rolback, but the symlinks will persist.
*Note that some packages like alacritty (terminal) are hard-coded to the waybar config files, so changing them here may not have any effect on waybar actions*

### Pacman packages
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

### Flatpaks
  - org.signal.Signal
  - org.chromium.Chromium
  - io.freetubeapp.FreeTube
