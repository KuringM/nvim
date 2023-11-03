return {
	require('conf/plugins/plugins_editor/tcomment_vim'),  -- An extensible & universal comment vim-plugin that also handles embedded filetypes. in <space>cn to comment a line.
	require('conf/plugins/plugins_editor/bullets_vim'),  -- Bullets.vim is a Vim/NeoVim plugin for automated bullet lists.
	-- require('conf/plugins/plugins_editor/vim-smoothie')
	require('conf/plugins/plugins_editor/move_nvim'),   -- Gain the power to move lines and blocks and auto-indent them!
	require('conf/plugins/plugins_editor/yanky_nvim'),   --  Improved Yank and Put functionalities for Neovim
	-- require('conf/plugins/plugins_editor/substitute_nvim'),   -- Neovim plugin introducing a new operators motions to quickly replace and exchange text.
	require('conf/plugins/plugins_editor/nvim-ufo'),
	require('conf/plugins/plugins_editor/nvim-autopairs'),
	-- require('conf/plugins/plugins_editor/telescope_nvim'),  -- Find, Filter, Preview, Pick. All lua, all the time.
	-- require('conf/plugins/plugins_editor/commander_nvim'),
	require('conf/plugins/plugins_editor/fzf-lua'),
	{ 'theniceboy/antovim', lazy = false, },
	{ 'gcmt/wildfire.vim',  lazy = false, },
	{ 'sjl/clam.vim'   },  -- A lightweight Vim plugin for working with shell commands.
	{ 'AmaiSaeta/capture.vim' },   -- Capture ex-command output to new buffer.
	require('conf/plugins/plugins_editor/smartim'),  -- A Vim plugin to make it stand well with input methods (Mac only)
	-- {	'lilydjwg/fcitx.vim' },  -- keep and restore fcitx state when leaving/re-entering insert mode
	require('conf/plugins/plugins_editor/Tabmerge'),  -- Merge a tab's windows with the current tab
	require('conf/plugins/plugins_editor/nvim-surround'),  -- Add/change/delete surrounding delimiter pairs with ease. Written with ❤️ in Lua.
	require('conf/plugins/plugins_editor/vim-visual-multi'),  -- Multiple cursors plugin for vim/neovim
	require('conf/plugins/plugins_editor/undotree'),  -- The undo history visualizer for VIM
	require('conf/plugins/plugins_editor/flash_nvim'),  -- Navigate your code with search labels, enhanced character motions and Treesitter integration
	-- require('conf/plugins/plugins_editor/leap_nvim'),  -- Neovim's answer to the mouse 🦘
	-- search, jump
	require('conf/plugins/plugins_editor/nvim-hlslens'),   -- Hlsearch Lens for Neovim
	require('conf/plugins/plugins_editor/any-jump'),  -- Jump to any definition and references 👁 IDE madness without overhead 🚀
	-- require('conf/plugins/plugins_editor/nvim-spectre'),  -- Find the enemy and replace them with dark power.
	-- require('conf/plugins/plugins_editor/ultisnips'),  -- UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
	-- require('conf/plugins/plugins_editor/LuaSnip'),  -- Snippet Engine for Neovim written in Lua.
	require('conf/plugins/plugins_editor/vim-rooter'),  -- Changes Vim working directory to project root.
	require('conf/plugins/plugins_editor/copilot_vim'),  -- Neovim plugin for GitHub Copilot

	-- Code Format
	{ 'godlygeek/tabular' },  -- vim script for text filtering and alignment
}
