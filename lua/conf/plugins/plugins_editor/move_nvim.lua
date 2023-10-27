return
{ -- Gain the power to move lines and blocks and auto-indent them!
	"fedepujol/move.nvim",
	config = function()
		local opts = { noremap = true, silent = true }
		-- Normal-mode commands
		vim.keymap.set('n', '<c-y>', ':MoveLine(1)<CR>', opts)
		vim.keymap.set('n', '<c-l>', ':MoveLine(-1)<CR>', opts)

		-- Visual-mode commands
		vim.keymap.set('v', '<c-e>', ':MoveBlock(1)<CR>', opts)
		vim.keymap.set('v', '<c-u>', ':MoveBlock(-1)<CR>', opts)
	end
}
