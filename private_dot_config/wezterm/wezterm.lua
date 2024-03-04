-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.initial_rows = 41
config.term = "wezterm"
config.initial_cols = 160

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Batman'

config.font = wezterm.font_with_fallback({
	{ family = "JetBrains Mono Nerd Font", weight = "Medium" },
	"nonicons",
})

config.font_size = 10.5

config.window_background_opacity = 0.98

-- default is true, has more "native" look
config.use_fancy_tab_bar = false

-- I don't like putting anything at the edge if I can help it.
config.enable_scroll_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.color_scheme = "Catppuccin Mocha"
config.enable_tab_bar = false
config.freetype_load_target = "HorizontalLcd"

-- and finally, return the configuration to wezterm
return config
