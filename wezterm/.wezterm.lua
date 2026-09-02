local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux

-- Shell y Dominios
config.default_domain = "local"

-- Iniciamos Arch como proceso nativo para mantener el Acrylic
-- config.default_prog = { "wsl.exe", "-d", "archlinux", "--user", "Gary", "--cd", "~", "--", "zellij" }
-- config.default_prog = { "wsl.exe", "-d", "archlinux", "--user", "Gary", "--", "bash", "-lc", "zellij" }
config.default_prog = {
	"wsl.exe",
	"-d",
	"archlinux",
	"--user",
	"Gary",
	"--cd",
	"~",
	-- "--",
	-- "zellij",
}

config.wsl_domains = {
	{
		name = "WSL:archlinux",
		distribution = "archlinux",
		username = "Gary",
		default_cwd = "~",
	},
}

-- Estética de la Ventana
config.win32_system_backdrop = "Acrylic" -- Acrylic
config.window_background_opacity = 0.5
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.enable_tab_bar = false
config.use_ime = false
config.enable_wayland = false

-- Tipografía
config.font = wezterm.font("IosevkaTerm Nerd Font")
-- config.font = wezterm.font("CaskaydiaCove Nerd Font")
-- config.font = wezterm.font("JetBrainsMono Nerd Font")

config.font_size = 13
config.default_cursor_style = "SteadyBar"
config.cursor_blink_rate = 0
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- Cursor blanco
config.colors = {
	cursor_bg = "#FFFFFF",
	cursor_fg = "#000000",
	cursor_border = "#FFFFFF",
}

-- Rendimiento
-- config.front_end = "OpenGL"
config.front_end = "OpenGL"
config.animation_fps = 1
config.max_fps = 144

if wezterm.target_triple:find("windows") then
	config.term = "xterm-256color"
else
	config.term = "wezterm"
end

-- Tamaño y comportamiento de ventana
-- config.window_decorations = "NONE | RESIZE"
wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return config
