-- https://github.com/shellRaining/hlchunk.nvim
-- This is the lua implementation of nvim-hlchunk, you can use this neovim plugin to highlight your indent line and the current chunk (context) your cursor stayed

return {
	"shellRaining/hlchunk.nvim",
	ft= {"lua", "py", "sh", },
	config = function()
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
}
