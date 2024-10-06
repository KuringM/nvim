return {
	"gbprod/substitute.nvim", -- Neovim plugin introducing a new operators motions to quickly replace and exchange text.
	config = function()
		local substitute = require("substitute")
		substitute.setup({
			highlight_substituted_text = {
				enabled = true,
				timer = 200,
			},
		})
		vim.keymap.set("n", "s", substitute.operator, { noremap = true })
		vim.keymap.set("n", "ss", substitute.line, { noremap = true })
		vim.keymap.set("n", "sI", substitute.eol, { noremap = true })
		vim.keymap.set("x", "s", substitute.visual, { noremap = true })
		vim.keymap.set("n", "<leader>s", require("substitute.range").operator, { noremap = true })
		vim.keymap.set("x", "<leader>s", require("substitute.range").visual, { noremap = true })
		vim.keymap.set("n", "<leader>ss", require("substitute.range").word, { noremap = true })
	end,
}
