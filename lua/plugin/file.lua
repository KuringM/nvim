return {
	-- Changes Vim working directory to project root.
	{
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
	},
	{ "yianwillis/vimcdoc" }, -- vim chinese doc
	{ "dstein64/vim-startuptime", cmd = { "StartupTime" } }, -- A plugin for profiling Vim and Neovim startup time.
	{ "sjl/clam.vim", cmd = { "Clam" } }, -- A lightweight Vim plugin for working with shell commands.
	{ "AmaiSaeta/capture.vim", cmd = { "Capture" } }, -- Capture ex-command output to new buffer.
	-- { "lilydjwg/fcitx.vim" },                                                                                                           -- keep and restore fcitx state when leaving/re-entering insert mode

	-- A Vim plugin to make it stand well with input methods (Mac only)
	{
		"ybian/smartim",
		config = function()
			vim.g.smartim_default = "com.apple.keylayout.Colemak"
		end,
	},

	-- Merge a tab's windows with the current tab
	{
		"vim-scripts/Tabmerge",
		keys = { "tme" },
		config = function()
			vim.keymap.set({ "n", "v" }, "tme", ":Tabmerge<CR><C-w>t<C-w>H<C-w>l", { noremap = true })
		end,
	},

	-- The undo history visualizer for VIM
	{
		"mbbill/undotree",
		keys = { "L" },
		config = function()
			vim.cmd([[
			noremap L :UndotreeToggle<CR>
			let g:undotree_DiffAutoOpen = 1
			let g:undotree_SetFocusWhenToggle = 1
			let g:undotree_ShortIndicators = 1
			let g:undotree_WindowLayout = 2
			let g:undotree_DiffpanelHeight = 8
			let g:undotree_SplitWidth = 24
			function g:Undotree_CustomMap()
				nmap <buffer> u <plug>UndotreeNextState
				nmap <buffer> e <plug>UndotreePreviousState
				nmap <buffer> U 5<plug>UndotreeNextState
				nmap <buffer> E 5<plug>UndotreePreviousState
			endfunc]])
		end,
	},

	{ "fladson/vim-kitty", ft = "kitty" }, -- Vim syntax highlighting for Kitty terminal config files
}
