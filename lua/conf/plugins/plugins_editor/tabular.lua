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
		vim.cmd([[AddTabularPattern first_comma /^[^,]*\zs,/l1l1l1]])
		vim.cmd([[
			AddTabularPipeline multiple_spaces / \{2,}/
			\ map(a:lines, "substitute(v:val, ' \{2,}', '  ', 'g')")
			\   | tabular#TabularizeStrings(a:lines, '  ', 'l0')
		]])
	end,
}
