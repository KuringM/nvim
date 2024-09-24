return {
	"shellRaining/hlchunk.nvim", -- This is the lua implementation of nvim-hlchunk, you can use this neovim plugin to highlight your indent line and the current chunk (context) your cursor stayed
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
				enable = true,
				chars = {
					"․",
					"⁚",
					"⁖",
					"⁘",
					"⁙",
				},
				style = {
					{ bg = "#434437" },
					{ bg = "#2f4440" },
					{ bg = "#433054" },
					{ bg = "#284251" },
				},
			},
		})
	end,
}
