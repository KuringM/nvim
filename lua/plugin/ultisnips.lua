-- https://github.com/SirVer/ultisnips
-- UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!

return {
	"SirVer/ultisnips",
	dependencies = {
		"honza/vim-snippets",
	},
	config = function()
		vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "UltiSnips/tex", "vim-snippets" }
		vim.g.UltiSnipsExpandTrigger = "<C-E>"
		vim.g.UltiSnipsExpandOrJumpTrigger = "<C-E>"
		vim.g.UltiSnipsJumpOrExpandTrigger = "<C-E>"
		vim.g.UltiSnipsJumpForwardTrigger = "<C-E>"
		vim.keymap.set("i", "<C-U>", "<Nop>", { noremap = true })
		vim.g.UltiSnipsJumpBackwardTrigger = "<C-U>"
	end,
}
