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
	require('conf/plugins/editor_plugins/tcomment_vim'),  -- An extensible & universal comment vim-plugin that also handles embedded filetypes. in <space>cn to comment a line.
	require('conf/plugins/editor_plugins/vim-illuminate'),  -- automatically highlighting other uses of the current word under the cursor
	require('conf/plugins/editor_plugins/bullets_vim'),  -- Bullets.vim is a Vim/NeoVim plugin for automated bullet lists.
	-- require('conf/plugins/editor_plugins/vim-smoothie')
	require('conf/plugins/editor_plugins/nvim-colorizer'),
	{ 'theniceboy/antovim', lazy = false, },
	{ 'gcmt/wildfire.vim',  lazy = false, },
	require('conf/plugins/editor_plugins/move_nvim'),
	-- require('conf/plugins/editor_plugins/substitute_nvim'),
	require('conf/plugins/editor_plugins/nvim-ufo'),
	require('conf/plugins/editor_plugins/nvim-autopairs'),
}
