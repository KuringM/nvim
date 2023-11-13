local a = [[conf/plugins/plugins_appearance/]]

return {
	-- Colorscheme
	require(a .. "nvim-deus"),               -- The color scheme for neovim.
	require(a .. "nvim-colorizer"),          -- A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.

	-- Some Bar
	require(a .. "lualine_nvim"),            -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
	require(a .. "bufferline_nvim"),         -- A snazzy bufferline for Neovim
	require(a .. "nvim-scrollbar"),          -- Extensible Neovim Scrollbar

	-- Search
	require(a .. "nvim-hlslens"),            -- Hlsearch Lens for Neovim
	require(a .. "vim-illuminate"),          -- automatically highlighting other uses of the current word under the cursor.
	require(a .. "hlchunk_nvim"),            -- This is the lua implementation of nvim-hlchunk, you can use this neovim plugin to highlight your indent line and the current chunk (context) your cursor stayed

	-- Git
	require(a .. "gitsigns_nvim"),           -- Git integration for buffers
	require(a .. "lazygit_nvim"),            -- Plugin for calling lazygit from within neovim.
	-- require(a .. "blamer_nvim"),             -- A git blame plugin for neovim inspired by VS Code"s GitLens plugin

	-- Windows
	require(a .. "wilder_nvim"),             -- A more adventurous wildmenu
	require(a .. "colorful-winsep_nvim"),    -- Make your nvim window separators colorful

	-- Files Manager
	require(a .. "joshuto_nvim"),            -- ranger-like terminal file manager written in Rust
	require(a .. "rnvimr"),                  -- use Ranger in a floating window

	-- Notify
	require(a .. "nvim-notify"),             -- A fancy, configurable, notification manager for NeoVim

	-- Funny Games
	require(a .. "cellular-automaton_nvim"), -- A useless plugin that might help you cope with stubbornly broken tests or overall lack of sense in life. It lets you execute aesthetically pleasing, cellular automaton animations based on the content of neovim buffer.

	-- TODO
	-- require(a .. "NeoZoom_lua"),          -- A simple usecase of floating window to help you focus.
	-- require(a .. "dropbar_nvim"),         -- IDE-like breadcrumbs, out of the box
}
