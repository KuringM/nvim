return {
	"fenetikm/falcon",
	-- "Avimitin/neovim-deus", -- The color scheme for neovim
	lazy = false,
	-- priority = 1000,
	config = function()
		vim.cmd([[
			"let g:falcon_lightline = 1
			"let g:lightline.colorscheme = 'falcon'
			"let g:falcon_airline = 1
			"let g:airline_theme = 'falcon'
			set termguicolors
			" colorscheme falcon
		]])
	end,
}
