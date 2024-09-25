local M = {}
local p = require('vesper.palette')

function M.setup()
	vim.g.terminal_color_0 = p.vesper0
	vim.g.terminal_color_8 = p.vesper1

	vim.g.terminal_color_7 = p.fg0
	vim.g.terminal_color_15 = p.fg0

	vim.g.terminal_color_1 = p.error
	vim.g.terminal_color_9 = p.error

	vim.g.terminal_color_2 = p.green
	vim.g.terminal_color_10 = p.green

	vim.g.terminal_color_3 = p.warn
	vim.g.terminal_color_11 = p.warn

	vim.g.terminal_color_4 = p.hint
	vim.g.terminal_color_12 = p.hint

	vim.g.terminal_color_5 = p.purple
	vim.g.terminal_color_13 = p.purple

	vim.g.terminal_color_6 = p.cyan
	vim.g.terminal_color_14 = p.cyan
end

return M
