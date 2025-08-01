local config = {}

-- Nvim Treesitter configurations and abstraction layer
config.treesitter = {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	priority = 1000,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"c",
				"html",
				"java",
				"javascript",
				"json",
				"latex",
				"lua",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
				"yaml",
			},
			sync_install = true, -- Install parsers synchronously (only applied to `ensure_installed`)
			highlight = {
				enable = true,
				-- @vimtex support
				disable = { "latex", "markdown" },
			},
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gn",
					node_incremental = "gn",
					node_decremental = "gi",
					scope_incremental = "gm",
				},
			},
		})
		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
}

-- Refactor module for nvim-treesitter
config.tsRefactor = {
	"nvim-treesitter/nvim-treesitter-refactor",
	config = function()
		require("nvim-treesitter.configs").setup({
			refactor = {
				highlight_definitions = {
					enable = true,
					clear_on_cursor_move = true, -- Set to false if you have an `updatetime` of ~100.
				},
				highlight_current_scope = { enable = true },
				smart_rename = {
					enable = false, -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
					keymaps = {
						smart_rename = "grr",
					},
				},
				navigation = {
					enable = false, -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
					keymaps = {
						goto_definition = "gd",
						list_definitions = "gD",
						list_definitions_toc = "gO",
						goto_next_usage = "<a-*>",
						goto_previous_usage = "<a-#>",
					},
				},
			},
		})
	end,
}

-- Show code context
config.tsContext = {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		vim.keymap.set("n", "gt", function()
			require("treesitter-context").go_to_context(vim.v.count1)
		end, { silent = true, desc = "go to context" })
	end,
}

return {
	config.treesitter,
	config.tsRefactor,
	config.tsContext,
	"HiPhish/rainbow-delimiters.nvim", -- Rainbow delimiters for Neovim with Tree-sitter},
}
