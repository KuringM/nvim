return {
	--"theniceboy/nvim-deus",
	'Avimitin/neovim-deus',
	lazy = false,
	priority = 1000,
	config = function()
		vim.o.termguicolors=true
		vim.o.t_Co=256
		vim.cmd([[
		let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
		let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
		]])
		vim.o.background=dark    --Setting dark mode
		vim.g.deus_termcolors=256
		vim.cmd([[colorscheme deus]])
	end,
}
