local G = require("G")

return {
	{
		"kylechui/nvim-surround", -- Add/change/delete surrounding delimiter pairs with ease. Written with ❤️ in Lua.
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
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
	},

	{
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
	},

	{
		"theniceboy/antovim", -- Super-simple vim plugin for cycling through antonyms/words related to word under cursor. "gs"
		keys = { "gs" },
	},
}
