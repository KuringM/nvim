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
	require('conf/plugins/plugins_editor/move_nvim'),   -- Gain the power to move lines and blocks and auto-indent them!
	require('conf/plugins/plugins_editor/yanky_nvim'),   --  Improved Yank and Put functionalities for Neovim
	require('conf/plugins/plugins_editor/substitute_nvim'),   -- Neovim plugin introducing a new operators motions to quickly replace and exchange text.
	require('conf/plugins/plugins_editor/nvim-ufo'),
	require('conf/plugins/plugins_editor/nvim-autopairs'),
	-- require('conf/plugins/plugins_editor/telescope_nvim'),  -- Find, Filter, Preview, Pick. All lua, all the time.
	-- require('conf/plugins/plugins_editor/commander_nvim'),
	require('conf/plugins/plugins_editor/fzf-lua'),
	{ 'theniceboy/antovim', lazy = false, },
	{ 'gcmt/wildfire.vim',  lazy = false, },
	{ 'sjl/clam.vim'   },  -- A lightweight Vim plugin for working with shell commands.
	{ 'AmaiSaeta/capture.vim' },   -- Capture ex-command output to new buffer.
	require('conf/plugins/plugins_editor/smartim'),  -- A Vim plugin to make it stand well with input methods (Mac only)
	{	'lilydjwg/fcitx.vim' },  -- keep and restore fcitx state when leaving/re-entering insert mode
	require('conf/plugins/plugins_editor/Tabmerge'),  -- Merge a tab's windows with the current tab
}
