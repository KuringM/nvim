return
{ -- This is the lua implementation of nvim-hlchunk, you can use this neovim plugin to highlight your indent line and the current chunk (context) your cursor stayed
	"shellRaining/hlchunk.nvim",
	init = function()
		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, { pattern = "*", command = "EnableHL", })
		require('hlchunk').setup({
			chunk = {
				enable = true,
				use_treesitter = false,
				style = {
					{ fg = "#806d9c" },
				},
			},
			indent = {
				chars = { "│", "¦", "┆", "┊", },
				use_treesitter = false,
			},
			blank = {
				enable = false,
			},
			line_num = {
				use_treesitter = true,
			},
		})
	end
}
