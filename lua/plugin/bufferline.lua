local config = {}

local bufferline_opts = {
	options = {
		mode = "tabs",
		diagnostics = "nvim_lsp",

		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or " ")
				s = s .. n .. sym
			end
			return s
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
			reveal = { "close" },
		},
	},
}

local function bufferline_cfg()
	require("bufferline").setup({
		highlights = {
			fill = {
				bg = vim.api.nvim_get_hl_by_name("Normal", true).background,
			},
			-- background = {
			-- 	bg = vim.g.terminal_color_8,
			-- },
		},
	})
end

-- A snazzy bufferline for Neovim
config.bufferline = {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = bufferline_opts,
	config = bufferline_cfg,
}

return {
	config.bufferline,
}
