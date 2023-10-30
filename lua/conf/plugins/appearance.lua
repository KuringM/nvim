return {
	require('conf/plugins/plugins_appearance/nvim-deus'),  -- The color scheme for neovim.
	require('conf/plugins/plugins_appearance/vim-illuminate'),  -- automatically highlighting other uses of the current word under the cursor.
	require('conf/plugins/plugins_appearance/nvim-colorizer'),  -- A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.
	require("conf/plugins/plugins_appearance/hlchunk_nvim"),   -- This is the lua implementation of nvim-hlchunk, you can use this neovim plugin to highlight your indent line and the current chunk (context) your cursor stayed
	require('conf/plugins/plugins_appearance/lualine_nvim'),   --  A blazing fast and easy to configure neovim statusline plugin written in pure lua.
	require('conf/plugins/plugins_appearance/lazygit_nvim'),  -- Plugin for calling lazygit from within neovim.	
	require('conf/plugins/plugins_appearance/gitsigns_nvim'),   -- Git integration for buffers
	require('conf/plugins/plugins_appearance/nvim-scrollbar'),  -- Extensible Neovim Scrollbar
	-- require('conf/plugins/plugins_appearance/blamer_nvim'),
	require('conf/plugins/plugins_appearance/bufferline_nvim'),  -- A snazzy bufferline for Neovim
	-- require('conf/plugins/plugins_appearance/nvim-notify'),  -- A fancy, configurable, notification manager for NeoVim
	require('conf/plugins/plugins_appearance/joshuto_nvim'),  -- ranger-like terminal file manager written in Rust
	require('conf/plugins/plugins_appearance/wilder_nvim'),  -- A more adventurous wildmenu
	-- require('conf/plugins/plugins_appearance/dropbar_nvim'),  -- IDE-like breadcrumbs, out of the box
	require('conf/plugins/plugins_appearance/cellular-automaton_nvim'),  -- A useless plugin that might help you cope with stubbornly broken tests or overall lack of sense in life. It lets you execute aesthetically pleasing, cellular automaton animations based on the content of neovim buffer.
	require('conf/plugins/plugins_appearance/colorful-winsep_nvim'),  -- Make your nvim window separators colorful
	require('conf/plugins/plugins_appearance/NeoZoom_lua'),  -- A simple usecase of floating window to help you focus.
}
