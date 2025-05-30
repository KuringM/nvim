return {
	-- A fancy, configurable, notification manager for NeoVim
	{
		"rcarriga/nvim-notify",
		config = function()
			local notify = require("notify")
			vim.notify = notify
			notify.setup({
				on_open = function(win)
					vim.api.nvim_win_set_config(win, { border = "none" })
				end,
				level = 2,
				timeout = 1000,
				max_height = 5,
				stages = "slide",
				fps = 60,
				render = "wrapped-compact",
				minimum_width = 50,
				top_down = true,
			})
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<leader>;", function()
				require("telescope").extensions.notify.notify({
					layout_strategy = "vertical",
					layout_config = {
						width = 0.9,
						height = 0.9,
						-- preview_height = 0.1,
					},
					wrap_results = true,
				})
			end, opts)
		end,
	},

	-- 💥 Create key bindings that stick. WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type.
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		config = function()
			require("which-key").setup({
				preset = "helix", -- classic | modern | helix
				keys = {
					scroll_down = "<C-E>", -- binding to scroll down inside the popup
					scroll_up = "<C-U>", -- binding to scroll up inside the popup
				},
			})
		end,
	},
}
