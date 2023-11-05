local G = require("G")
return {
	"godlygeek/tabular", -- vim script for text filtering and alignment
	config = function()
		vim.keymap.set(
			"v",
			[[\t]],
			[[:'<,'>Tabularize //l1l1l1<left><left><left><left><left><left><left>]],
			{ noremap = true }
		)
		vim.keymap.set(
			"n",
			[[\t]],
			[[:Tabularize //l1l1l1<left><left><left><left><left><left><left>]],
			{ noremap = true }
		)

		vim.cmd([[
			" Aligning text with <Leader>a
			if exists(":Tabularize")
				noremap  <Leader>a= :Tabularize /=/l1l1l1<CR>
				vnoremap <Leader>a= :Tabularize /=/l1l1l1<CR>
				noremap  <Leader>a: :Tabularize /:\zs/l1l1l1<CR>
				vnoremap <Leader>a: :Tabularize /:\zs/l1l1l1<CR>
				noremap  <Leader>a, :Tabularize /,\zs/l1l1l1<CR>
				vnoremap <Leader>a, :Tabularize /,\zs/l1l1l1<CR>
				noremap  <Leader>a-- :Tabularize /--\zs/l1l1l1<CR>
				vnoremap <Leader>a-- :Tabularize /--\zs/l1l1l1<CR>
			endif
			AddTabularPattern! first_comma /^[^,]*\zs,/l1l1l1
			AddTabularPattern! first_< /^[^<]*\zs</l1l1l1
			AddTabularPipeline! multiple_spaces / \{2,}/
			\ map(a:lines, "substitute(v:val, ' \{2,}', '  ', 'g')")
			\   | tabular#TabularizeStrings(a:lines, '  ', 'l0')
		]])
	end,
}
