------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Get monitor names from hyprctl
local handle = io.popen("hyprctl monitors -j | jq -r '.[].name'")
if not handle then
	error("Failed to run hyprctl monitors")
end

local output = handle:read("*a")
handle:close()

-- Parse the newline-delimited list
for name in output:gmatch("[^\n]+") do
	hl.monitor({
		output = name,
		mode = "preferred",
		position = "auto",
		scale = "auto",
	})
end
