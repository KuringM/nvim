return {
	{
		"airblade/vim-rooter", -- Changes Vim working directory to project root.
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
	},
	{ "yianwillis/vimcdoc" }, -- vim chinese doc
	{ "dstein64/vim-startuptime", cmd = { "StartupTime" } }, -- A plugin for profiling Vim and Neovim startup time.
	{ "sjl/clam.vim", cmd = { "Clam" } }, -- A lightweight Vim plugin for working with shell commands.
	{ "AmaiSaeta/capture.vim", cmd = { "Capture" } }, -- Capture ex-command output to new buffer.
	-- { "lilydjwg/fcitx.vim" },                                                                                                           -- keep and restore fcitx state when leaving/re-entering insert mode
	{
		"ybian/smartim", -- A Vim plugin to make it stand well with input methods (Mac only)
		config = function()
			vim.g.smartim_default = "com.apple.keylayout.Colemak"
		end,
	},
}
