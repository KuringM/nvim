return {
	"kdheepak/lazygit.nvim", -- Plugin for calling lazygit from within neovim.
	keys = { "<c-g>" },
	config = function()
		vim.g.lazygit_floating_window_scaling_factor = 1.0
		vim.g.lazygit_floating_window_winblend = 0
		vim.g.lazygit_use_neovim_remote = true
		vim.keymap.set("n", "<c-g>", ":LazyGit<CR>", { noremap = true, silent = true })
	end,
}
