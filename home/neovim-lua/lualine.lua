local colors = require("catppuccin.palettes").get_palette "mocha"

-- Use one single status bar for the whole editor.
vim.o.laststatus = 3

-- This is a workaround for coloring not working on the ends of
-- the status line. Without this, the background of the first and
-- last characters are not written correctly.
local empty = {
	function() return ' ' end,
	padding = 0,
	color = 'Normal',
}

local filename = {
	'filename',
	file_status = true,
	path = 1, -- Show relative path.
	shorting_target = 25, -- Leave 25 characters for other things in the status line.

	symbols = {
		modified = '[+]',
		readonly = '[-]',
		unnamed = '[No Name]',
		newfile = '[New]',
	},
}

require("lualine").setup {
	extensions = { "quickfix", "nvim-tree", "toggleterm", "fzf" },
	options = {
		theme = "catppuccin",
		icons_enabled = true,
		component_separators = "|",
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			winbar = { "dashboard", "NvimTree" },
		},
	},
	sections = {
		lualine_a = {
			empty,
			{ "mode", separator = { left = "", right = "" }, right_padding = 2 },
		},
		lualine_b = { filename, "branch" },
		lualine_c = { "fileformat", "diagnostics", "lsp_progress" },
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = {
			{
				"location",
				separator = { left = "", right = "" },
				left_padding = 2,
				color = { fg = colors.white, bg = colors.off_blue }
			},
			empty,
		},
	},
	inactive_sections = {
		lualine_a = {
			empty,
			{ "mode", separator = { left = "", right = "" }, right_padding = 2 },
		},
		lualine_b = { filename, "branch" },
		lualine_c = { "fileformat", "diagnostics", "lsp_progress" },
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = {
			{
				"location",
				separator = { left = "", right = "" },
				left_padding = 2,
				color = { fg = colors.white, bg = colors.off_blue }
			},
			empty,
		},
	},
	tabline = {},
    --[[
	winbar = {
		lualine_a = { empty, {"os.date('%H:%M')", separator = { left = "", right = "" } } },
		lualine_b = {
			{ "diagnostics" },
		},
		lualine_c = { "searchcount"},
		lualine_x = {},
		lualine_y = {
			{
				'filename',
				file_status = true,
				path = 1, -- Show relative path.
				shorting_target = 25, -- Leave 25 characters for other things in the status line.

				symbols = {
					modified = '[+]',
					readonly = '[-]',
					unnamed = '[No Name]',
					newfile = '[New]',
				},

				separator = { left = "", right = "" },
			},
			{
				"filetype",
				colored = true,
				icon_only = true,
				separator = { left = "", right = "" },
			},
			empty
		},
		lualine_z = {},
	},
	inactive_winbar = {
		lualine_a = {},
		lualine_b = {
			empty,
			-- {
			-- 	function() return ' ' end,
			-- 	padding = 0,
			-- 	color = 'Normal',
			-- 	separator = { left = "", right = "" },
			-- },
			{ "diagnostics", separator = { left = "", right = "" }, },
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {
			{
				"filename",
				file_status = true,
				path = 1, -- Show relative path.
				shorting_target = 25, -- Leave 25 characters for other things in the status line.

				symbols = {
					modified = '[+]',
					readonly = '[-]',
					unnamed = '[No Name]',
					newfile = '[New]',
				},

				separator = { left = "", right = "" },
			},
			{
				"filetype",
				colored = true,
				icon_only = true,
				separator = { left = "", right = "" },
			},
			empty
		},
		lualine_z = {},
	},
    ]]
}
