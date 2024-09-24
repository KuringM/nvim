local a = [[/plugins/plugins_appearance/]]

return {
	-- Colorscheme rice
	require(a .. "nvim-deus"),               -- The color scheme for neovim.
	require(a .. "falcon"),                  -- The color scheme for neovim.
	require(a .. "nvim-colorizer"),          -- A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.
	require(a .. "hlchunk_nvim"),            -- This is the lua implementation of nvim-hlchunk, you can use this neovim plugin to highlight your indent line and the current chunk (context) your cursor stayed

	-- Interface rice and enhance
	require(a .. "lualine_nvim"),            -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
	require(a .. "bufferline_nvim"),         -- A snazzy bufferline for Neovim
	require(a .. "nvim-scrollbar"),          -- Extensible Neovim Scrollbar
	require(a .. "wilder_nvim"),             -- A more adventurous wildmenu
	require(a .. "colorful-winsep_nvim"),    -- Make your nvim window separators colorful
	require(a .. "dropbar_nvim"),            -- IDE-like breadcrumbs, out of the box
	require(a .. "nvim-notify"),             -- A fancy, configurable, notification manager for NeoVim
	require(a .. "rnvimr"),                  -- use Ranger in a floating window

	-- Search rice and enhance
	require(a .. "nvim-hlslens"),            -- Hlsearch Lens for Neovim
	require(a .. "vim-illuminate"),          -- automatically highlighting other uses of the current word under the cursor.

	-- Git
	require(a .. "gitsigns_nvim"),           -- Git integration for buffers
	require(a .. "lazygit_nvim"),            -- Plugin for calling lazygit from within neovim.
	require(a .. "blamer_nvim"),             -- A git blame plugin for neovim inspired by VS Code"s GitLens plugin

	-- Funny Games
	require(a .. "cellular-automaton_nvim"), -- A useless plugin that might help you cope with stubbornly broken tests or overall lack of sense in life. It lets you execute aesthetically pleasing, cellular automaton animations based on the content of neovim buffer.
}
