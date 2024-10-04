return {
	"APZelos/blamer.nvim", -- A git blame plugin for neovim inspired by VS Code's GitLens plugin
	config = function()
		vim.g.blamer_enabled = true
		vim.g.blamer_relative_time = true
		vim.g.blamer_prefix = " -> "
		vim.g.blamer_date_format = '%Y/%m/$d %H:%M'
		vim.cmd([[
			highlight Blamer guifg=lightgrey
		]])
	end,
}
