local G = require("G")

return {
	"nvim-pack/nvim-spectre", -- Find the enemy and replace them with dark power.
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		replace_engine = {
			["sd"] = {
				cmd = "sd",
				options = {},
			},
		},
		default = {
			replace = {
				--pick one of item in replace_engine
				cmd = "sd",
			},
		},
	},
	config = function()
		vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
			desc = "Toggle Spectre",
		})
		vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
			desc = "Search current word",
		})
		vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
			desc = "Search current word",
		})
		vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
			desc = "Search on current file",
		})
		require("spectre").setup({
			mapping = {
				["tab"] = {
					map = "<C-E>",
					cmd = "<cmd>lua require('spectre').tab()<cr>",
					desc = "next query",
				},
				["shift-tab"] = {
					map = "<C-U>",
					cmd = "<cmd>lua require('spectre').tab_shift()<cr>",
					desc = "previous query",
				},
			},
		})
	end,
}
