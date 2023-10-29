return{
	'vim-scripts/Tabmerge',  -- Merge a tab's windows with the current tab
	keys = { "tme" },
	config = function()
		vim.keymap.set({'n', 'v'}, "tme", ':Tabmerge<CR><C-w>t<C-w>H<C-w>l', { noremap = true, })
	end
}
