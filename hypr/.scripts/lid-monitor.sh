#!/usr/bin/env bash

# Get the lid state from the proc file
LID_STATE="/proc/acpi/button/lid/LID/state"

# Get internal name (eDP-1)
edp="$(hyprctl monitors all -j | jq -r '[.[] | select(.name | startswith("eDP-"))][0].name // empty' 2>/dev/null)"
[ -n "$edp" ] || return 0

# Get external display (DP-1 or DP-2)
# # Get external display name (DP-1, DP-2, etc.)
dp="$(hyprctl monitors all -j | jq -r '[.[] | select(.name | startswith("DP-"))][0].name // empty' 2>/dev/null)"
[ -n "$dp" ] || return 0

# set isOpen as true by default
isOpen=true
# if proc file states closed, set isOpen as false
grep closed "$LID_STATE" 2>/dev/null && isOpen=false

# ------------------
# ---- LID OPEN ----
# ------------------
if ["$isOpen" = true]; then
  # Turn on internal monitor
  hyprctl eval 'hl.dispatch(hl.dsp.dpms({ action = "on", monitor = "$edp" }))'
  # Move workspace-1 to internal monitor (external)
  hyprctl eval 'hl.dispatch(hl.dsp.workspace.move({ workspace = "1", monitor = "$edp" }))'
fi

# ------------------
# ---- LID SHUT ----
# ------------------
if ["$isOpen" = false]; then
  # Turn off internal monitor
  hyprctl eval 'hl.dispatch(hl.dsp.dpms({ action = "off", monitor = "$edp" }))'
  # Move workspace-1 to external monitor
  hyprctl eval 'hl.dispatch(hl.dsp.workspace.move({ workspace = "1", monitor = "$dp" }))'
fi
