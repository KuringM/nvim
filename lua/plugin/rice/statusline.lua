return {
	"nvim-lualine/lualine.nvim", -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- You can optionally lazy-load heirline on UiEnter
	-- to make sure all required plugins and colorschemes are loaded before setup
	-- event = "UiEnter",
	config = function()
		-- cool function for progress
		local progress = function()
			return "%l/%L:%c"
		end
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode", "g:coc_status" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = { "filesize", "encoding", "fileformat", "filetype" },
				lualine_z = { progress, "progress", "selectioncount" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
