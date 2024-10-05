local a = [[/plugin/rice/]]

return {
	------------------------------------------------------------------------
	--                           RICE Interface                           --
	------------------------------------------------------------------------

	require(a .. "nvim-deus"),            -- The color scheme for neovim.
	-- require(a .. "falcon"),               -- The color scheme for neovim.
	require(a .. "lualine_nvim"),         -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
	require(a .. "bufferline_nvim"),      -- A snazzy bufferline for Neovim
	require(a .. "dropbar_nvim"),         -- IDE-like breadcrumbs, out of the box
	require(a .. "statuscol_nvim"),       -- Status column plugin that provides a configurable 'statuscolumn' and click handlers.
	require(a .. "nvim-colorizer"),       -- A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.
	require(a .. "nvim-scrollbar"),       -- Extensible Neovim Scrollbar
	require(a .. "nvim-ufo"),             -- Not UFO in the sky, but an ultra fold in Neovim.
	require(a .. "wilder_nvim"),          -- A more adventurous wildmenu
	require(a .. "hlchunk_nvim"),         -- This is the lua implementation of nvim-hlchunk, you can use this neovim plugin to highlight your indent line and the current chunk (context) your cursor stayed
	require(a .. "colorful-winsep_nvim"), -- Make your nvim window separators colorful
	require(a .. "nvim-notify"),          -- A fancy, configurable, notification manager for NeoVim
	require(a .. "undotree"),             -- The undo history visualizer for VIM
	require(a .. "commander_nvim"),       -- Create and manage keybindings and commands in a more organized manner, and search them quickly through Telescope
	require(a .. "which-key"),            -- 💥 Create key bindings that stick. WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type.
	require(a .. "Tabmerge"),             -- Merge a tab"s windows with the current tab

	-- Find, Search, Jump...
	require(a .. "fzf-lua"),              -- Improved fzf.vim written in lua
	require(a .. "telescope_nvim"),       -- Find, Filter, Preview, Pick. All lua, all the time.
	require(a .. "flash_nvim"),           -- Navigate your code with search labels, enhanced character motions and Treesitter integration
	require(a .. "any-jump"),             -- Jump to any definition and references 👁 IDE madness without overhead 🚀
	require(a .. "nvim-hlslens"),         -- Hlsearch Lens for Neovim
	require(a .. "vim-illuminate"),       -- automatically highlighting other uses of the current word under the cursor.
	require(a .. "rnvimr"),               -- use Ranger in a floating window
	require(a .. "nvim-spectre"),         -- Find the enemy and replace them with dark power.

	-- Git
	require(a .. "gitsigns_nvim"),        -- Git integration for buffers
	require(a .. "lazygit_nvim"),         -- Plugin for calling lazygit from within neovim.

	-- Funny Games
	require(a .. "cellular-automaton_nvim"), -- A useless plugin that might help you cope with stubbornly broken tests or overall lack of sense in life. It lets you execute aesthetically pleasing, cellular automaton animations based on the content of neovim buffer.
}
