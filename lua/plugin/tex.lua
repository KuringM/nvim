-- https://github.com/lervag/vimtex
-- VimTeX: A modern Vim and neovim filetype plugin for LaTeX files.

return {
	"lervag/vimtex",
	lazy = false,
	ft = { "markdown", "tex", "latex" },
	init = function() end,
	config = function()
		vim.g.tex_flavor = "latex"
		vim.g.vimtex_view_method = "skim" -- PDF 预览方式(Skim 适用于 macOS)
		vim.g.vimtex_quickfix_mode = 0 -- 禁止自动打开 quickfix 窗口
	end,
}
