return {
	"akinsho/bufferline.nvim", -- A snazzy bufferline for Neovim
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			mode = "tabs",
			-- diagnostics = "nvim_lsp",
			diagnostics = "coc",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
			indicator = {
				icon = "▎", -- this should be omitted if indicator style is not 'icon'
				-- style = 'icon' | 'underline' | 'none',
				style = "icon",
			},
			show_buffer_close_icons = false,
			show_close_icon = false,
			enforce_regular_tabs = true,
			show_duplicate_prefix = false,
			tab_size = 16,
			padding = 0,
			separator_style = "thick",
			hover = {
				enabled = true,
				delay = 200,
				reveal = {'close'}
			},
			
		},
	},
	config = function ()
		require('bufferline').setup({
			highlights = {
				fill = {
					bg = vim.g.terminal_color_8,
				},
				background = {
					bg = vim.g.terminal_color_8,
				},
			},
		})
	end,
}
