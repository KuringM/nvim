-- Move the next character to the end of the line with ctrl+u in Insert Mode.
vim.cmd([[
fun! s:MakePair()
	let line = getline('.')
	let len = strlen(line)
	if line[len - 1] == ";" || line[len - 1] == ","
		normal! lx$P
	else
		normal! lx$p
	endif
endfun
inoremap <c-u> <ESC>:call <SID>MakePair()<CR>
]])

return {
	require('conf/plugins/plugins_editor/tcomment_vim'),  -- An extensible & universal comment vim-plugin that also handles embedded filetypes. in <space>cn to comment a line.
	require('conf/plugins/plugins_editor/bullets_vim'),  -- Bullets.vim is a Vim/NeoVim plugin for automated bullet lists.
	-- require('conf/plugins/plugins_editor/vim-smoothie')
	require('conf/plugins/plugins_editor/move_nvim'),
	-- require('conf/plugins/plugins_editor/substitute_nvim'),
	require('conf/plugins/plugins_editor/nvim-ufo'),
	require('conf/plugins/plugins_editor/nvim-autopairs'),
	{ 'theniceboy/antovim', lazy = false, },
	{ 'gcmt/wildfire.vim',  lazy = false, },
}
