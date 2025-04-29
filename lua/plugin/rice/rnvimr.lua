return {
	"kevinhwang91/rnvimr", -- use Ranger in a floating window
	keys = { "R" },
	build = {
		"pip3 install ranger-fm pynvim",
	},
	config = function()
		vim.cmd([[
			let g:rnvimr_enable_ex = 1
			let g:rnvimr_enable_pick = 1
			" let g:rnvimr_draw_border = 0
			let g:rnvimr_enable_bw = 1
			highlight link RnvimrNormal CursorLine
			nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
			let g:rnvimr_action = {
									\ '<C-t>': 'NvimEdit tabedit',
									\ '<C-x>': 'NvimEdit split',
									\ '<C-v>': 'NvimEdit vsplit',
									\ 'gw': 'JumpNvimCwd',
									\ 'yw': 'EmitRangerCwd'
									\ }
			let g:rnvimr_layout = { 'relative': 'editor',
									\ 'width': &columns,
									\ 'height': &lines,
									\ 'col': 0,
									\ 'row': 0,
									\ 'style': 'minimal' }
			let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]
		]])
	end,
}
