local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- ─────────────────────────────────────────────
-- Font
-- ─────────────────────────────────────────────
config.font_size = 8
-- config.font = wezterm.font("FiraCode Nerd Font")

-- ─────────────────────────────────────────────
-- Fenêtre / UI
-- ─────────────────────────────────────────────
config.window_decorations = "RESIZE" -- Retire la title bar
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.window_background_opacity = 1.0

-- ─────────────────────────────────────────────
-- Couleurs / Tab bar
-- ─────────────────────────────────────────────
config.colors = {
	tab_bar = {
		background = "#2c2b2b",
		active_tab = {
			bg_color = "#414040",
			fg_color = "#FFFFFF",
		},
	},
}

config.color_scheme = "Darcula (base16)"

-- ─────────────────────────────────────────────
-- Hyperlinks
-- Garde les liens web, supprime chemins & prompt
-- ─────────────────────────────────────────────
config.hyperlink_rules = {
	{
		regex = [[\bhttps?://[^\s]+\b]],
		format = "$0",
	},
}

-- ─────────────────────────────────────────────
-- Leader key
-- ─────────────────────────────────────────────
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1500 }
local act = wezterm.action

-- ─────────────────────────────────────────────
-- Keybinds
-- ─────────────────────────────────────────────
config.keys = {
	-- Splits
	{
		key = "%",
		mods = "LEADER|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = '"',
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	-- Reload config
	{
		key = "R",
		mods = "LEADER|SHIFT",
		action = act.ReloadConfiguration,
	},

	-- New tab
	{
		key = "c",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	},

	-- Pane navigation
	{
		key = "LeftArrow",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Down"),
	},

	-- Close tab
	{
		key = "d",
		mods = "LEADER",
		action = act.CloseCurrentTab({ confirm = true }),
	},

	-- Tab navigation (Ctrl+Shift+Arrows)
	{
		key = "RightArrow",
		mods = "CTRL|SHIFT",
		action = act.ActivateTabRelative(1),
	},
}

-- Tab navigation (Ctrl+Shift+Left)
table.insert(config.keys, {
	key = "LeftArrow",
	mods = "CTRL|SHIFT",
	action = act.ActivateTabRelative(-1),
})

-- Switch tab with Leader + number
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

-- ─────────────────────────────────────────────
-- Fin
-- ─────────────────────────────────────────────
return config

