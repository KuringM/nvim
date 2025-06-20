return {
	-- UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
	{
		"SirVer/ultisnips",
		config = function()
			vim.g.UltiSnipsExpandTrigger = "<c-e>"
			vim.g.UltiSnipsJumpForwardTrigger = "<c-e>"
			vim.g.UltiSnipsJumpBackwardTrigger = "<c-u>"
			vim.g.UltiSnipsJumpOrExpandTrigger = "<c-e>"
			vim.g.UltiSnipsSnippetDirectories = { "snips", "snips/tex" }
		end,
	},
}
