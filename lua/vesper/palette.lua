local c = {
  none = "NONE",

  bg = "#101010",
  bg_light = "#1C1C1C",
  bg_dark = "#161616",
  -- comment = ("#282828"),

  fg = "#FFFFFF",

  gray = "#666666",
  gray1 = "#7E7E7E",
  gray2 = "#707070",

  gray_dark = "#343434",
  gray_light = "#A0A0A0",
  comment = "#505050",

  black = "#000000",
  black_light = "#232323",

  orange = "#FF7300",
  gold = "#FFC799",
  peach = "#FFCFA8",
  pepermint = "#99FFE4",
  red = "#FF8080",
  --
  -- git = { change = "#6183bb", add = "#449dab", delete = "#914c54" },
  -- gitSigns = {
  -- 	add = "#266d6a",
  -- 	change = "#536c9e",
  -- 	delete = "#b2555b",
  -- },
}

---@class Palette
local scheme = {
  base = "#101010",
  base_light = "#1C1C1C",
  base_dark = "#161616",
  base_darker = "#282828",

  black = "#000000",
  black_light = "#232323",

  fg = "#FFFFFF",

  gray = "#666666",
  gray_dark = "#343434",
  gray_light = "#A0A0A0",

  gray1 = "#7E7E7E",
  gray2 = "#707070",

  comment = "#505050",

  orange = "#FF7300",
  gold = "#FFC799",
  peach = "#FFCFA8",
  pepermint = "#99FFE4",
  red = "#FF8080",
  --
  -- git = { change = "#6183bb", add = "#449dab", delete = "#914c54" },
  -- gitSigns = {
  -- 	add = "#266d6a",
  -- 	change = "#536c9e",
  -- 	delete = "#b2555b",
  -- },
}

-- ---@return ColorScheme
-- function M.setup(opts)
-- 	opts = opts or {}
-- 	local config = require("vesper.config")
--
-- 	-- Color Palette
-- 	---@class ColorScheme: Palette
-- 	local colors = config.options
--
-- 	-- util.bg = colors.bg
-- 	-- util.day_brightness = config.options.day_brightness
-- 	--
-- 	-- colors.diff = {
-- 	--   add = util.darken(colors.green2, 0.15),
-- 	--   delete = util.darken(colors.red1, 0.15),
-- 	--   change = util.darken(colors.blue7, 0.15),
-- 	--   text = colors.blue7,
-- 	-- }
-- 	--
-- 	-- colors.git.ignore = colors.dark3
-- 	-- colors.black = util.darken(colors.bg, 0.8, "#000000")
-- 	-- colors.border_highlight = util.darken(colors.blue1, 0.8)
-- 	-- colors.border = colors.black
-- 	--
-- 	-- -- Popups and statusline always get a dark background
-- 	-- colors.bg_popup = colors.bg_dark
-- 	-- colors.bg_statusline = colors.bg_dark
-- 	--
-- 	-- -- Sidebar and Floats are configurable
-- 	-- colors.bg_sidebar = config.options.styles.sidebars == "transparent" and colors.none
-- 	--     or config.options.styles.sidebars == "dark" and colors.bg_dark
-- 	--     or colors.bg
-- 	--
-- 	-- colors.bg_float = config.options.styles.floats == "transparent" and colors.none
-- 	--     or config.options.styles.floats == "dark" and colors.bg_dark
-- 	--     or colors.bg
-- 	--
-- 	-- colors.bg_visual = util.darken(colors.blue0, 0.4)
-- 	-- colors.bg_search = colors.blue0
-- 	-- colors.fg_sidebar = colors.fg_dark
-- 	-- -- colors.fg_float = config.options.styles.floats == "dark" and colors.fg_dark or colors.fg
-- 	-- colors.fg_float = colors.fg
-- 	--
-- 	-- colors.error = colors.red1
-- 	-- colors.warning = colors.yellow
-- 	-- colors.info = colors.blue2
-- 	-- colors.hint = colors.teal
-- 	--
-- 	-- colors.delta = {
-- 	--   add = util.darken(colors.green2, 0.45),
-- 	--   delete = util.darken(colors.red1, 0.45),
-- 	-- }
-- 	--
-- 	-- config.options.on_colors(colors)
-- 	-- if opts.transform and config.is_day() then
-- 	--   util.invert_colors(colors)
-- 	-- end
-- 	--
-- 	-- return colors
-- end

return scheme
