local a = [[plugin/plugins_editor/]]

return {
	-- Format Enhance
	require(a .. "tabular"),            -- vim script for text filtering and alignment
	require(a .. "conform_nvim"),       -- Lightweight yet powerful formatter plugin for Neovim
	require(a .. "bullets_vim"),        -- 🔫Bullets.vim is a Vim/NeoVim plugin for automated bullet lists.
	require(a .. "nvim-autopairs"),     -- autopairs for neovim written by lua

	-- Edit Enhance
	{ "AmaiSaeta/capture.vim" },         -- Capture ex-command output to new buffer.
	require(a .. "Tabmerge"),           -- Merge a tab"s windows with the current tab
	require(a .. "tcomment_vim"),       -- An extensible & universal comment vim-plugin that also handles embedded filetypes. in <space>cn to comment a line.
	require(a .. "vim-visual-multi"),   -- Multiple cursors plugin for vim/neovim
	require(a .. "undotree"),           -- The undo history visualizer for VIM
	-- require(a .. "copilot_vim"),        -- Neovim plugin for GitHub Copilot

	-- Search, Jump, Substitute, Yank, Object...
	require(a .. "flash_nvim"),         -- Navigate your code with search labels, enhanced character motions and Treesitter integration
	require(a .. "any-jump"),           -- Jump to any definition and references 👁 IDE madness without overhead 🚀
	require(a .. "move_nvim"),          -- Gain the power to move lines and blocks and auto-indent them!
	require(a .. "nvim-surround"),      -- Add/change/delete surrounding delimiter pairs with ease. Written with ❤️ in Lua.
	require(a .. "yanky_nvim"),         -- Improved Yank and Put functionalities for Neovim
	require(a .. "fzf-lua"),            -- Improved fzf.vim written in lua
	require(a .. "telescope_nvim"),     -- Find, Filter, Preview, Pick. All lua, all the time.
	{ "theniceboy/antovim", lazy = false }, -- Super-simple vim plugin for cycling through antonyms/words related to word under cursor. "gs"
	{ "gcmt/wildfire.vim", lazy = false }, -- Smart selection of the closest text object

	-- Keyboard Enhance
	require(a .. "smartim"),            -- A Vim plugin to make it stand well with input methods (Mac only)
	-- { "lilydjwg/fcitx.vim" },         -- keep and restore fcitx state when leaving/re-entering insert mode

	-- Shell Enhance
	{ "sjl/clam.vim" },                  -- A lightweight Vim plugin for working with shell commands.

	-- TODO
	require(a .. "vim-rooter"),         -- Changes Vim working directory to project root.
	-- require(a .. "vim-smoothie"),
	-- require(a .. "nvim-ufo"),        -- Not UFO in the sky, but an ultra fold in Neovim.
	-- require(a .. "nvim-spectre"),    -- Find the enemy and replace them with dark power.
	-- require(a .. "ultisnips"),       -- UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
	-- require(a .. "LuaSnip"),         -- Snippet Engine for Neovim written in Lua.
	-- require(a .. "leap_nvim"),       -- Neovim"s answer to the mouse 🦘
	-- require(a .. "substitute_nvim"), -- Neovim plugin introducing a new operators motions to quickly replace and exchange text.
	-- require(a .. "commander_nvim"),
}
