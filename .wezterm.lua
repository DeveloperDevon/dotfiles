local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = true,
	window_decorations = "TITLE | RESIZE",
	default_cursor_style = "BlinkingBar",
	color_scheme = "Nord (Gogh)",
	-- font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
	font = wezterm.font("MesloLGS Nerd Font Mono"),
	font_size = 16.5,
	window_background_opacity = 0.9,
	macos_window_background_blur = 10,
}
-- config.font = wezterm.font("MesloLGS Nerd Font Mono")
-- config.font_size = 19
--
config.enable_tab_bar = false
-- config.window_decorations = "RESIZE"
--
-- config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 10

return config
