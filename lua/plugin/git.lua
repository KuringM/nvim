return {
	-- Git integration for buffers
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "▎" },
					change = { text = "░" },
					delete = { text = "_" },
					topdelete = { text = "▔" },
					changedelete = { text = "▒" },
					untracked = { text = "┆" },
				},
			})
			vim.keymap.set("n", "<leader>g-", ":Gitsigns prev_hunk<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>g=", ":Gitsigns next_hunk<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "H", ":Gitsigns preview_hunk_inline<CR>", { noremap = true, silent = true })
		end,
	},

	-- Plugin for calling lazygit from within neovim.
	{
		"kdheepak/lazygit.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<c-g>", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
		config = function()
			vim.g.lazygit_floating_window_scaling_factor = 1.0
			vim.g.lazygit_floating_window_winblend = 0
			vim.g.lazygit_use_neovim_remote = true
		end,
	},
}
