-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
--
config.color_scheme = "Gruvbox Material (Gogh)"
config.font = wezterm.font("Mononoki Nerd Font Mono")
config.font_size = 16

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 15

config.set_environment_variables = {
	LANG = "fr_FR.UTF-8",
}
-- and finally, return the configuration to wezterm
return config
