return
{
	"gbprod/substitute.nvim",
	config = function()
		local substitute = require("substitute")
		substitute.setup({
			on_substitute = require("yanky.integration").substitute(),
			highlight_substituted_text = {
				enabled = true,
				timer = 200,
			},
		})
		vim.keymap.set("n", "s", substitute.operator, { noremap = true })
		vim.keymap.set("n", "sh", function() substitute.operator({ motion = "e" }) end, { noremap = true })
		vim.keymap.set("x", "s", require('substitute.range').visual, { noremap = true })
		vim.keymap.set("n", "ss", substitute.line, { noremap = true })
		vim.keymap.set("n", "sI", substitute.eol, { noremap = true })
		vim.keymap.set("x", "s", substitute.visual, { noremap = true })
	end
}
