return {
	"lervag/vimtex",
	lazy = false,
	init = function() end,
	config = function()
		vim.g.tex_flavor = "latex"
		vim.g.vimtex_view_method = "skim"
	end,
}
