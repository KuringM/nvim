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
	end,
}
