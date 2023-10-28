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
	-- require('conf/plugins/plugins_appearance/nvim-notify')  -- A fancy, configurable, notification manager for NeoVim
}
