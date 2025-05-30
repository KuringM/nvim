return {
	-- Add/change/delete surrounding delimiter pairs with ease. Written with ❤️ in Lua.
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	-- Find the enemy and replace them with dark power.
	{
		"nvim-pack/nvim-spectre",
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

	-- Neovim plugin introducing a new operators motions to quickly replace and exchange text.
	{
		"gbprod/substitute.nvim",
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

	-- Super-simple vim plugin for cycling through antonyms/words related to word under cursor. "gs"
	{
		"theniceboy/antovim",
		keys = { "gs" },
	},

	-- Clipboard manager neovim plugin with telescope integration
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			{ "kkharji/sqlite.lua", module = "sqlite" },
		},
		config = function()
			vim.keymap.set("n", "<leader>y", ":Telescope neoclip<CR>", { noremap = true })
			require("neoclip").setup({
				history = 1000,
				enable_persistent_history = true,
				keys = {
					telescope = {
						i = {
							select = "<c-y>",
							paste = "<cr>",
							paste_behind = "<c-g>",
							replay = "<c-q>", -- replay a macro
							delete = "<c-d>", -- delete an entry
							edit = "<c-k>", -- edit an entry
							custom = {},
						},
					},
				},
			})
		end,
	},

	-- 🧠 💪 // Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
			vim.api.nvim_set_keymap(
				"n",
				"<leader>c",
				"gcc",
				{ desc = "Toggles the current line using linewise comment" }
			)
			vim.api.nvim_set_keymap(
				"v",
				"<leader>c",
				"gc",
				{ desc = "Toggles the current line using linewise comment" }
			)
		end,
	},
}
