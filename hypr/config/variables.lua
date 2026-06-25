local SUPER_SHIFT = "SUPER + SHIFT"
local SUPER = "SUPER"

-- pacman packages (ensure these are installed or update with your own options)
local terminal = "alacritty"
local resources = "btop"
local fileManager = "dolphin"
local browser = "firefox"
local menu = "fuzzel"
local screenshot = "grim"
local logout = "wlogout"

-- launch commands (for uilities that require arguments or run as TUI)
-- ex. "alacritty -e btop" (TUI)
local launch_resources = terminal .. " -e " .. resources
local launch_screenshot = "cd $HOME/Pictures && " .. terminal .. " -e " .. screenshot

-- flatpak packages (ensure these are installed or update with your own options)
local messages = "flatpak run org.signal.Signal"
local webapp = "flatpak run org.chromium.Chromium --new-window --app="
local freetube = "flatpak run io.freetubeapp.FreeTube"

-- web apps (update with your own preferred services)
-- launch webapps as
-- flatpak run org.chromium.Chromium --new-window --app='https://youtube.com'
local email = webapp .. "'https://mail.proton.me/u/1/inbox'"
local calendar = webapp .. "'https://calendar.proton.me/u/1/'"
local passwords = webapp .. "'https://pass.proton.me/u/1'"
local chatbot = webapp .. "'https://lumo.proton.me'"
local notes = webapp .. "'https://usememos.com/docs/getting-started'"
local music = webapp .. "'https://www.navidrome.org/docs/installation/'"
local photos = webapp .. "'https://docs.immich.app/install/docker-compose/'"
local youtube = webapp .. "'https://youtube.com'"
local reddit = webapp .. "'https://reddit.com'"
local bluesky = webapp .. "'https://bsky.app'"
local discord = webapp .. "https://discord.com/channels/@me"

return {
    mods = {
        super_shift = SUPER_SHIFT,
        super = SUPER,
    },
    apps = {
        terminal = terminal,
        menu = menu,
        fileManager = fileManager,
        browser = browser,
        resources = launch_resources,
        screenshot = launch_screenshot,
        logout = logout,
        messages = messages,
        email = email,
        calendar = calendar,
        passwords = passwords,
        notes = notes,
        music = music,
        photos = photos,
        chatbot = chatbot,
        youtube = youtube, -- or freetube (flatpak)
        reddit = reddit,
        bluesky = bluesky,
        discord = discord,
    },
}
