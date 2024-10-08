return {
	"gelguy/wilder.nvim", -- A more adventurous wildmenu
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"romgrk/fzy-lua-native",
		"nixprime/cpsm",
		"roxma/nvim-yarp",
		"roxma/vim-hug-neovim-rpc",
	},
	build = {
		"luarocks install pcre2",
	},
	config = function()
		local wilder = require("wilder")
		wilder.setup({
			modes = { ":", "/", "?" },
			next_key = "<Tab>",
			previous_key = "<S-Tab>",
		})

		-- Pipeline
		wilder.set_option("pipeline", {
			wilder.branch(
				wilder.python_file_finder_pipeline({
					file_command = { "rg", "--files" },
					dir_command = { "fd", "-tf" },
					filters = { "fuzzy_filter", "difflib_sorter" },
				}),
				wilder.cmdline_pipeline({
					language = "vim",
					fuzzy = 1,
				}),
				-- wilder.search_pipeline()
				wilder.python_search_pipeline({
					pattern = wilder.python_fuzzy_pattern(),
					sorter = wilder.python_difflib_sorter(),
					engine = "re",
				})
			),
		})

		-- Popupmenu renderer theme
		wilder.set_option(
			"renderer",
			wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
				highlighter = {
					wilder.basic_highlighter(),
					wilder.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
					wilder.lua_fzy_highlighter(), -- requires fzy-lua-native vim plugin found at https://github.com/romgrk/fzy-lua-native
				},
				highlights = {
					accent = wilder.make_hl(
						"WilderAccent",
						"Pmenu",
						{ { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }
					),
					border = "Normal",
				},
				left = { " ", wilder.popupmenu_devicons() },
				right = { " ", wilder.popupmenu_scrollbar() },
				border = "rounded",
			}))
		)

		--  popupmenu palette theme
		wilder.set_option(
			"renderer",
			wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
				highlighter = {
					wilder.basic_highlighter(),
					wilder.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
					wilder.lua_fzy_highlighter(), -- requires fzy-lua-native vim plugin found at https://github.com/romgrk/fzy-lua-native
				},
				highlights = {
					accent = wilder.make_hl(
						"WilderAccent",
						"Pmenu",
						{ { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }
					),
					border = "Normal", -- highlight to use for the border
				},
				left = { " ", wilder.popupmenu_devicons() },
				right = { " ", wilder.popupmenu_scrollbar() },
				border = "rounded",
				max_height = "75%", -- max height of the palette
				min_height = 0, -- set to the same as 'max_height' for a fixed height window
				prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
				reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
			}))
		)
	end,
}
