return {
	"SirVer/ultisnips", -- UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
	dependencies = {
		"honza/vim-snippets", -- vim-snipmate default snippets (Previously snipmate-snippets)
	},

	config = function()
		vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/Ultisnips" }
		-- vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
		-- vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
		-- vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
		-- vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
		-- vim.g.UltiSnipsRemoveSelectModeMappings = 0
	end,
}
