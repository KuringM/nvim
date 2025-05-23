local a = [[plugin/editor/]]

return {
	{ "yianwillis/vimcdoc" },                                -- vim chinese doc
	{ "dstein64/vim-startuptime", cmd = { "StartupTime" } }, -- A plugin for profiling Vim and Neovim startup time.
	{ "sjl/clam.vim", cmd = { "Clam" } },                    -- A lightweight Vim plugin for working with shell commands.
	{ "AmaiSaeta/capture.vim", cmd = { "Capture" } },        -- Capture ex-command output to new buffer.
	{ "theniceboy/antovim", keys = { "gs" } },               -- Super-simple vim plugin for cycling through antonyms/words related to word under cursor. "gs"
	-- { "lilydjwg/fcitx.vim" },                                                                                                           -- keep and restore fcitx state when leaving/re-entering insert mode
	require(a .. "smartim"),                                 -- A Vim plugin to make it stand well with input methods (Mac only)
	require(a .. "nvim-autopairs"),                          -- autopairs for neovim written by lua
	require(a .. "nvim-surround"),                           -- Add/change/delete surrounding delimiter pairs with ease. Written with ❤️ in Lua.
	require(a .. "vim-rooter"),                              -- Changes Vim working directory to project root.
	require(a .. "tabular"),                                 -- vim script for text filtering and alignment
	require(a .. "conform_nvim"),                            -- Lightweight yet powerful formatter plugin for Neovim
	require(a .. "Comment_nvim"),                            -- 🧠 💪 // Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
	require(a .. "substitute_nvim"),                         -- Neovim plugin introducing a new operators motions to quickly replace and exchange text.
	require(a .. "nvim-neoclip"),                            -- Clipboard manager neovim plugin with telescope integration
	require(a .. "vim-visual-multi"),                        -- Multiple cursors plugin for vim/neovim
	require(a .. "nvim-spectre"),                            -- Find the enemy and replace them with dark power.
}
