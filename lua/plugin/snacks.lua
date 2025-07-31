-- https://github.com/theniceboy/antovim
-- Super-simple vim plugin for cycling through antonyms/words related to word under cursor. "gs"

local config = {}

-- Changes Vim working directory to project root.
config.vimRooter = {
	"airblade/vim-rooter",
	init = function()
		vim.g.rooter_patterns = { "__vim_project_root", ".git/" }
		vim.g.rooter_silent_chdir = true
		-- set an autocmd
		vim.api.nvim_create_autocmd("VimEnter", {
			pattern = "*",
			callback = function()
				-- source .nvim.lua at project root
				vim.cmd([[silent! source .vim.lua]])
			end,
		})
	end,
}

-- Merge a tab's windows with the current tab
config.Tabmerge = {
	"vim-scripts/Tabmerge",
	keys = { "tme" },
	config = function()
		vim.keymap.set({ "n", "v" }, "tme", ":Tabmerge<CR><C-w>t<C-w>H<C-w>l", { noremap = true })
	end,
}

return {
	{ "yianwillis/vimcdoc" }, -- vim chinese doc
	{ "dstein64/vim-startuptime", cmd = { "StartupTime" } }, -- A plugin for profiling Vim and Neovim startup time.
	{ "sjl/clam.vim", cmd = { "Clam" } }, -- A lightweight Vim plugin for working with shell commands.
	{ "AmaiSaeta/capture.vim", cmd = { "Capture" } }, -- Capture ex-command output to new buffer.
	{ "fladson/vim-kitty", ft = "kitty" }, -- Vim syntax highlighting for Kitty terminal config files
	{ "theniceboy/antovim", keys = { "gs" } },
	config.vimRooter,
	config.Tabmerge,
}
