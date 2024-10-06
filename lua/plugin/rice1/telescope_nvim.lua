return {
	"nvim-telescope/telescope.nvim", -- Find, Filter, Preview, Pick. All lua, all the time.
	dependencies = {
		"nvim-lua/plenary.nvim", -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- FZF sorter for telescope written in c
		{
			"LukasPietzschmann/telescope-tabs", -- Fly through your tabs in NeoVim ✈️
			config = function()
				local tstabs = require("telescope-tabs")
				tstabs.setup({})
				vim.keymap.set("n", "<c-t>", tstabs.list_tabs, {})
			end,
		},
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
		local builtin = require("telescope.builtin")
		local m = { noremap = true, nowait = true }
		vim.keymap.set("n", "<c-p>", builtin.find_files, m)
		vim.keymap.set("n", "<leader>rs", builtin.resume, m)
		vim.keymap.set("n", "<c-w>", builtin.buffers, m)
		vim.keymap.set("n", "<c-h>", builtin.oldfiles, m)
		vim.keymap.set("n", "<c-_>", builtin.current_buffer_fuzzy_find, m)
		vim.keymap.set("n", "z=", builtin.spell_suggest, m)
		vim.keymap.set("n", "<leader>d", builtin.diagnostics, m)
		vim.keymap.set("n", [[\g]], builtin.git_status, m)
		vim.keymap.set("n", ":", builtin.commands, m)

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
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})

		ts.load_extension("fzf")
		ts.load_extension("dap")
		ts.load_extension("simulators")
	end,
}
