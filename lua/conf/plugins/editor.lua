local a = [[conf/plugins/plugins_editor/]]

return {
	-- Code Format
	require( a .. "tabular"),            -- vim script for text filtering and alignment
	require( a .. "conform_nvim"),       -- Lightweight yet powerful formatter plugin for Neovim

	require( a .. "tcomment_vim"),       -- An extensible & universal comment vim-plugin that also handles embedded filetypes. in <space>cn to comment a line.
	require( a .. "bullets_vim"),        -- Bullets.vim is a Vim/NeoVim plugin for automated bullet lists.
	-- require( a .. "vim-smoothie"Lightweight)
	require( a .. "move_nvim"),          -- Gain the power to move lines and blocks and auto-indent them!
	require( a .. "yanky_nvim"),         -- Improved Yank and Put functionalities for Neovim
	-- require( a .. "substitute_nvim"), -- Neovim plugin introducing a new operators motions to quickly replace and exchange text.
	require( a .. "nvim-ufo"),
	require( a .. "nvim-autopairs"),
	-- require( a .. "telescope_nvim"),  -- Find, Filter, Preview, Pick. All lua, all the time.
	-- require( a .. "commander_nvim"),
	require( a .. "fzf-lua"),
	{ "theniceboy/antovim", lazy = false },
	{ "gcmt/wildfire.vim", lazy = false },
	{ "sjl/clam.vim" },                  -- A lightweight Vim plugin for working with shell commands.
	{ "AmaiSaeta/capture.vim" },         -- Capture ex-command output to new buffer.
	require( a .. "smartim"),            -- A Vim plugin to make it stand well with input methods (Mac only)
	-- { "lilydjwg/fcitx.vim" },         -- keep and restore fcitx state when leaving/re-entering insert mode
	require( a .. "Tabmerge"),           -- Merge a tab"s windows with the current tab
	require( a .. "nvim-surround"),      -- Add/change/delete surrounding delimiter pairs with ease. Written with ❤️ in Lua.
	require( a .. "vim-visual-multi"),   -- Multiple cursors plugin for vim/neovim
	require( a .. "undotree"),           -- The undo history visualizer for VIM
	require( a .. "flash_nvim"),         -- Navigate your code with search labels, enhanced character motions and Treesitter integration
	-- require( a .. "leap_nvim"),       -- Neovim"s answer to the mouse 🦘
	-- search, jump
	require( a .. "nvim-hlslens"),       -- Hlsearch Lens for Neovim
	require( a .. "any-jump"),           -- Jump to any definition and references 👁 IDE madness without overhead 🚀
	-- require( a .. "nvim-spectre"),    -- Find the enemy and replace them with dark power.
	-- require( a .. "ultisnips"),       -- UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
	-- require( a .. "LuaSnip"),         -- Snippet Engine for Neovim written in Lua.
	require( a .. "vim-rooter"),         -- Changes Vim working directory to project root.
	require( a .. "copilot_vim"),        -- Neovim plugin for GitHub Copilot
}
