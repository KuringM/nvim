return {
	"pechorin/any-jump.vim", -- Jump to any definition and references 👁 IDE madness without overhead 🚀
	keys = { "j" },
	config = function()
		vim.keymap.set("n", "j", ":AnyJump<CR>", { noremap = true })
		vim.keymap.set("x", "j", ":AnyJumpVisual<CR>", { noremap = true })
		vim.g.any_jump_disable_default_keybindings = true
		vim.g.any_jump_window_width_ratio = 0.9
		vim.g.any_jump_window_height_ratio = 0.9
	end,
}
