return {
	-- Snippet Engine for Neovim written in Lua.
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},

	-- UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
	-- {
	-- 	"SirVer/ultisnips",
	-- 	config = function()
	-- 		vim.g.UltiSnipsExpandTrigger = "<c-e>"
	-- 		vim.g.UltiSnipsJumpForwardTrigger = "<c-e>"
	-- 		vim.g.UltiSnipsJumpBackwardTrigger = "<c-u>"
	-- 		vim.g.UltiSnipsJumpOrExpandTrigger = "<c-e>"
	-- 		vim.g.UltiSnipsSnippetDirectories = { "snips", "snips/tex" }
	-- 	end,
	-- },
}
