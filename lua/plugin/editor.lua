local a = [[plugin/Editor/]]

return {
	{ "sjl/clam.vim" },                  -- A lightweight Vim plugin for working with shell commands.
	{ "AmaiSaeta/capture.vim" },         -- Capture ex-command output to new buffer.
	{ "theniceboy/antovim", lazy = false }, -- Super-simple vim plugin for cycling through antonyms/words related to word under cursor. "gs"
	{ "gcmt/wildfire.vim", lazy = false }, -- Smart selection of the closest text object
	require(a .. "vim-rooter"),         -- Changes Vim working directory to project root.
	require(a .. "smartim"),            -- A Vim plugin to make it stand well with input methods (Mac only)
	-- { "lilydjwg/fcitx.vim" },         -- keep and restore fcitx state when leaving/re-entering insert mode
	require(a .. "tabular"),            -- vim script for text filtering and alignment
	require(a .. "conform_nvim"),       -- Lightweight yet powerful formatter plugin for Neovim
	require(a .. "bullets_vim"),        -- 🔫Bullets.vim is a Vim/NeoVim plugin for automated bullet lists.
	require(a .. "nvim-autopairs"),     -- autopairs for neovim written by lua
	require(a .. "Tabmerge"),           -- Merge a tab"s windows with the current tab
	require(a .. "tcomment_vim"),       -- An extensible & universal comment vim-plugin that also handles embedded filetypes. in <space>cn to comment a line.
	require(a .. "vim-visual-multi"),   -- Multiple cursors plugin for vim/neovim
	-- require(a .. "copilot_vim"),        -- Neovim plugin for GitHub Copilot
	require(a .. "move_nvim"),          -- Gain the power to move lines and blocks and auto-indent them!
	require(a .. "nvim-surround"),      -- Add/change/delete surrounding delimiter pairs with ease. Written with ❤️ in Lua.
	require(a .. "nvim-neoclip"),       -- Clipboard manager neovim plugin with telescope integration
	require(a .. "substitute_nvim"),    -- Neovim plugin introducing a new operators motions to quickly replace and exchange text.
}
