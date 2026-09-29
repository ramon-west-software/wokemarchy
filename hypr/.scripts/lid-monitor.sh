#!/usr/bin/env bash

# Get the lid state from the proc file
LID="/proc/acpi/button/lid/LID/state"

# Get eDP-_ name (eDP-1)
edp="$(hyprctl monitors all -j | jq -r '[.[] | select(.name | startswith("eDP-"))][0].name // empty' 2>/dev/null)"
[ -n "$edp" ] || return 0

# Get external display (DP-1 or DP-2)
# # Get eDP-_ name (eDP-1)
dp="$(hyprctl monitors all -j | jq -r '[.[] | select(.name | startswith("DP-"))][0].name // empty' 2>/dev/null)"
[ -n "$edp" ] || return 0

# set lid state open or closed
lid=open
grep close "$LID" 2>/dev/null && lid=closed

# ------------------
# ---- LID SHUT ----
# ------------------

# Turn off internal monitor (does not disable)
# hyprctl eval 'hl.dispatch(hl.dsp.dpms({ action = "off", monitor = "$edp" }))'

# Move workspaces to active monitor (external)
# hyprctl eval 'hl.dispatch(hl.dsp.workspace.move({ workspace = "1", monitor = "$dp" }))'


# ------------------
# ---- LID OPEN ----
# ------------------

# Turn on internal monitor
# hyprctl eval 'hl.dispatch(hl.dsp.dpms({ action = "on", monitor = "$edp" }))'

# Move workspace-1 to internal monitor (external)
# hyprctl eval 'hl.dispatch(hl.dsp.workspace.move({ workspace = "1", monitor = "$edp" }))'
