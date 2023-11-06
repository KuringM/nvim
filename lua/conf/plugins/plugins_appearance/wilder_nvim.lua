return {
	"gelguy/wilder.nvim", -- A more adventurous wildmenu
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local wilder = require("wilder")
		wilder.setup({
			modes = { ":" },
			next_key = "<Tab>",
			previous_key = "<S-Tab>",
		})
		wilder.set_option(
			"renderer",
			wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
				highlights = {
					border = "Normal", -- highlight to use for the border
				},
				left = { " ", wilder.popupmenu_devicons() },
				right = { " ", wilder.popupmenu_scrollbar() },
				-- 'single', 'double', 'rounded' or 'solid'
				-- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
				border = "rounded",
				max_height = "50%", -- max height of the palette
				min_height = 0, -- set to the same as 'max_height' for a fixed height window
				prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
				reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
			}))
		)
		wilder.set_option("pipeline", {
			wilder.branch(
				wilder.cmdline_pipeline({
					language = "vim",
					fuzzy = 1,
				}),
				wilder.search_pipeline()
			),
		})
	end,
}
