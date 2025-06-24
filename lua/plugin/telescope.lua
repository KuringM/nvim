local config = {}

-- Find, Filter, Preview, Pick. All lua, all the time.
config.telescope = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- FZF sorter for telescope written in c
		{
			"stevearc/dressing.nvim", -- Neovim plugin to improve the default vim.ui interfaces
			config = function()
				require("dressing").setup({
					select = {
						get_config = function(opts)
							if opts.kind == "codeaction" then
								return {
									backend = "telescope",
									telescope = require("telescope.themes").get_cursor(),
								}
							end
						end,
					},
				})
			end,
		},
		{
			"dimaportenko/telescope-simulators.nvim", -- A telescope.nvim extension to open iOS simulators and Android emulators.
			config = function()
				require("simulators").setup({
					android_emulator = false,
					apple_simulator = true,
				})
			end,
		},
		{
			"folke/trouble.nvim",
			opts = {
				use_diagnostic_signs = true,
				action_keys = {
					close = "<esc>",
					previous = "u",
					next = "e",
				},
			},
		},
	},
	config = function()
		local ts = require("telescope")
		ts.setup({
			defaults = {
				mappings = {
					i = {
						["<C-h>"] = "which_key",
						["<C-u>"] = "move_selection_previous",
						["<C-e>"] = "move_selection_next",
						["<C-l>"] = "preview_scrolling_up",
						["<C-y>"] = "preview_scrolling_down",
						["<esc>"] = "close",
						["<C-n>"] = require("telescope.actions").cycle_history_next,
						["<C-p>"] = require("telescope.actions").cycle_history_prev,
					},
				},
				layout_strategy = "vertical",
				layout_config = {
					width = 0.9,
					height = 0.9,
				},
				prompt_prefix = "🔍 ",
				selection_caret = " ",
				path_display = { "truncate" },
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--fixed-strings",
					"--smart-case",
					"--trim",
				},
			},
		})

		ts.load_extension("fzf")
		ts.load_extension("simulators")

		local builtin = require("telescope.builtin")
		vim.keymap.set(
			"n",
			"<leader>tf",
			builtin.find_files,
			{ noremap = true, nowait = true, desc = "Telescope find files" }
		)
		vim.keymap.set(
			"n",
			"<leader>tb",
			builtin.buffers,
			{ noremap = true, nowait = true, desc = "Telescope buffers" }
		)
		vim.keymap.set(
			"n",
			"<leader>to",
			builtin.oldfiles,
			{ noremap = true, nowait = true, desc = "Telescope old files" }
		)
		vim.keymap.set(
			"n",
			"<leader>ts",
			builtin.spell_suggest,
			{ noremap = true, nowait = true, desc = "Telescope spell suggest" }
		)
		vim.keymap.set(
			"n",
			"<leader>td",
			builtin.diagnostics,
			{ noremap = true, nowait = true, desc = "Telescope diagnostics" }
		)
		vim.keymap.set(
			"n",
			"<leader>tg",
			builtin.git_status,
			{ noremap = true, nowait = true, desc = "Telescope git status" }
		)
		vim.keymap.set(
			"n",
			"<leader>tt",
			builtin.treesitter,
			{ noremap = true, nowait = true, desc = "Telescope treesitter" }
		)
		vim.keymap.set("n", ":", builtin.commands, { noremap = true, nowait = true, desc = "Telescope commands" })
	end,
}

return {
	config.telescope,
}
