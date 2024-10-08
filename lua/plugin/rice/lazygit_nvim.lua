return {
	"kdheepak/lazygit.nvim", -- Plugin for calling lazygit from within neovim.
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<c-g>", "<cmd>LazyGit<cr>", desc = "LazyGit" },
	},
	config = function()
		vim.g.lazygit_floating_window_scaling_factor = 1.0
		vim.g.lazygit_floating_window_winblend = 0
		vim.g.lazygit_use_neovim_remote = true
	end,
}
