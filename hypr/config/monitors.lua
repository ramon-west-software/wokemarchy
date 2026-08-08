------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

-- Internal laptop display
hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

-- External monitor
hl.monitor({
	output = "DP-2",
	mode = "1920x1080@75",
	position = "0x0",
	scale = "auto",
})
