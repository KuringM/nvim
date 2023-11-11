return {
	"psliwka/vim-smoothie",
	config = function()
		-- vim.cmd([[nnoremap <unique> <C-e> <cmd>call smoothie#do("\<C-D>") <CR>]])
		-- vim.cmd([[nnoremap <unique> <C-u> <cmd>call smoothie#do("\<C-U>") <CR>]])
		vim.cmd([[
		nnoremap <unique> <C-D> <cmd>call smoothie#do("\<C-D>") <CR>
		vnoremap <unique> <C-D> <cmd>call smoothie#do("\<C-D>") <CR>
		]])
	end,
}
