return {
	"SirVer/ultisnips",
	config = function()
		vim.g.UltiSnipsExpandTrigger = "<c-e>"
		vim.g.UltiSnipsJumpForwardTrigger = "<c-e>"
		vim.g.UltiSnipsJumpBackwardTrigger = "<c-u>"
		vim.g.UltiSnipsJumpOrExpandTrigger = "<c-e>"
		vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "UltiSnips/tex" }
	end,
}
