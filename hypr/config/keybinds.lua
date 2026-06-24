---------------------
---- KEYBINDINGS ----
---------------------
local vars = require("config.variables")
local SUPER_SHIFT = vars.mods.super_shift
local SUPER = vars.mods.super

------------------
-- APPLICATIONS --
------------------

-- Desktop Application definitions
local terminal = vars.apps.terminal
local menu = vars.apps.menu
local fileManager = vars.apps.fileManager
local browser = vars.apps.browser
local resources = vars.apps.resources
local screenshot = vars.apps.screenshot
local logout = vars.apps.logout
local messages = vars.apps.messages

-- Web Application definitions
-- launched as "{webapp} --app {'url'}"
local email = vars.apps.email
local calendar = vars.apps.calendar
local passwords = vars.apps.passwords
local notes = vars.apps.notes
local music = vars.apps.music
local photos = vars.apps.photos
local chatbot = vars.apps.chatbot
local youtube = vars.apps.youtube
local reddit = vars.apps.reddit
local bluesky = vars.apps.bluesky
local discord = vars.apps.discord

-- Applcation binds
hl.bind(SUPER .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(SUPER .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(SUPER_SHIFT .. " + T", hl.dsp.exec_cmd(resources))
hl.bind(SUPER_SHIFT .. " + F", hl.dsp.exec_cmd(fileManager))
hl.bind(SUPER_SHIFT .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(SUPER_SHIFT .. " + G", hl.dsp.exec_cmd(messages))
hl.bind(SUPER_SHIFT .. " + E", hl.dsp.exec_cmd(email))
hl.bind(SUPER_SHIFT .. " + C", hl.dsp.exec_cmd(calendar))
hl.bind(SUPER_SHIFT .. " + CTRL + P", hl.dsp.exec_cmd(passwords))
hl.bind(SUPER_SHIFT .. " + N", hl.dsp.exec_cmd(notes))
hl.bind(SUPER_SHIFT .. " + P", hl.dsp.exec_cmd(photos))
hl.bind(SUPER_SHIFT .. " + M", hl.dsp.exec_cmd(music))
hl.bind(SUPER_SHIFT .. " + A", hl.dsp.exec_cmd(chatbot))
hl.bind(SUPER_SHIFT .. " + Y", hl.dsp.exec_cmd(youtube))
hl.bind(SUPER_SHIFT .. " + R", hl.dsp.exec_cmd(reddit))
hl.bind(SUPER_SHIFT .. " + X", hl.dsp.exec_cmd(bluesky))
hl.bind(SUPER_SHIFT .. " + D", hl.dsp.exec_cmd(discord))
hl.bind(SUPER .. " + Print", hl.dsp.exec_cmd(screenshot))
hl.bind(SUPER .. " + Escape", hl.dsp.exec_cmd(logout))

---------------------
-- WINDOW BEHAVIOR --
---------------------

-- Close Window
hl.bind(SUPER .. " + W", hl.dsp.window.close())
-- Toggle Window Float
hl.bind(SUPER .. " + T", hl.dsp.window.float({ action = "toggle" }))
-- Toggle Window Pseudo?
hl.bind(SUPER .. " + P", hl.dsp.window.pseudo())
-- Split
hl.bind(SUPER .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(SUPER .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(SUPER .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(SUPER .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(SUPER .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(SUPER .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(SUPER .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Resize active window.
hl.bind(SUPER .. " + equal", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })
hl.bind(SUPER .. " + minus", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
hl.bind(SUPER_SHIFT .. " + equal", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })
hl.bind(SUPER_SHIFT .. "+ minus", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(SUPER_SHIFT .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(SUPER_SHIFT .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Switch workspaces with MOD + [0-9]
-- Move active window to a workspace with MOD + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(SUPER .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(SUPER_SHIFT .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(SUPER .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(SUPER_SHIFT .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))

--------------------
-- MEDIA CONTROLS --
--------------------

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
