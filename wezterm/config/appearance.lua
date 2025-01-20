local wezterm = require("wezterm")
local gpu_adapters = require("utils.gpu_adapter")
local colors = require("colors.custom")

return {
	animation_fps = 240,
	max_fps = 240,
	front_end = "WebGpu",
	webgpu_power_preference = "HighPerformance",
	webgpu_preferred_adapter = gpu_adapters:pick(),

	-- color scheme
	-- colors = colors,
	color_scheme = "Catppuccin Mocha",

	-- background
	background = {
		{
			source = { File = wezterm.GLOBAL.background },
			opacity = 0.1,
			--height = "100%",
			--width = "33%",
		},
		--	{
		--		source = { Color = colors.background },
		--		height = "100%",
		--		width = "100%",
		--		opacity = 0,
		--	},
	},

	-- scrollbar
	enable_scroll_bar = true,

	-- tab bar
	enable_tab_bar = false,
	hide_tab_bar_if_only_one_tab = false,
	--use_fancy_tab_bar = true,
	--tab_max_width = 25,
	--show_tab_index_in_tab_bar = false,
	--switch_to_last_active_tab_when_closing_tab = true,

	-- window
	window_decorations = "TITLE | RESIZE",
	integrated_title_button_alignment = "Right",
	integrated_title_button_color = "Auto",
	integrated_title_button_style = "Windows",
	integrated_title_buttons = { "Hide", "Maximize", "Close" },
	initial_cols = 200,
	initial_rows = 50,
	window_padding = {
		left = 5,
		right = 10,
		top = 12,
		bottom = 7,
	},
	window_close_confirmation = "NeverPrompt",
	window_frame = {
		active_titlebar_bg = "#090909",
		-- font = fonts.font,
		-- font_size = fonts.font_size,
	},
	inactive_pane_hsb = {
		saturation = 0.7,
		brightness = 0.6,
	},

	-- bell stuff
	audible_bell = "Disabled", -- Disable the default audible bell
	visual_bell = {
		fade_in_duration_ms = 150,
		fade_out_duration_ms = 150,
		target = "CursorColor",
	},
}
