return {
	-- A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.
	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			filetypes = { "*" },
			user_default_options = {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = true, -- "Name" codes like Blue or blue
				RRGGBBAA = false, -- #RRGGBBAA hex codes
				AARRGGBB = true, -- 0xAARRGGBB hex codes
				rgb_fn = false, -- CSS rgb() and rgba() functions
				hsl_fn = false, -- CSS hsl() and hsla() functions
				css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				-- Available modes for `mode`: foreground, background,  virtualtext
				mode = "background", -- Set the display mode.
				-- Available methods are false / true / "normal" / "lsp" / "both"
				-- True is same as normal
				tailwind = true,
				sass = { enable = false },
				virtualtext = "■",
			},
			-- all the sub-options of filetypes apply to buftypes
			buftypes = {},
		},
	},

	-- Make your nvim window separators colorful
	{
		"nvim-zh/colorful-winsep.nvim",
		config = true,
		event = { "WinNew" },
	},

	-- This is the lua implementation of nvim-hlchunk, you can use this neovim plugin to highlight your indent line and the current chunk (context) your cursor stayed
	{
		"shellRaining/hlchunk.nvim",
		init = function()
			require("hlchunk").setup({
				chunk = {
					enable = true,
					use_treesitter = true,
					style = {
						{ fg = "#806d9c" },
					},
				},
				indent = {
					enable = true,
					chars = { "│", "¦", "┆", "┊" },
					use_treesitter = true,
					style = {
						vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
					},
				},
				line_num = {
					enable = true,
					use_treesitter = true,
				},
				blank = {
					enable = false,
					chars = {
						" ",
					},
					style = {
						{ bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("cursorline")), "bg", "gui") },
						{ bg = "", fg = "" },
					},
				},
			})
		end,
	},
}
