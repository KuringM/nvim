return {
	"stevearc/conform.nvim", -- Lightweight yet powerful formatter plugin for Neovim
	event = "VeryLazy",
	build = {
		"brew install fsouza/prettierd/prettierd",
		"brew install stylua",
		"brew install deno",
		"brew install clang-format",
		"pip install beautysh",
	},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				bash = { "beautysh" },
				zsh = { "beautysh" },
				cpp = { "clang-format" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				jsonc = { "prettierd" },
				lua = { "stylua" },
				rust = { "rustfmt" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				vue = { "prettierd" },
				yaml = { "prettierd" },
				zig = { "zigfmt" },
				go = {
					formatters = { "gofumpt", "goimports" },
					run_all_formatters = true,
				},
				python = {
					formatters = { "isort", "black" },
					run_all_formatters = true,
				},
				markdown = {
					"prettierd",
					"latexindet",
					"injected",
				},
				tex = { "latexindet" },
			},
		})
		require("conform.formatters.injected").options.ignore_errors = true
		vim.api.nvim_set_keymap("n", [[\f]], "", {
			noremap = true,
			silent = true,
			desc = "conform formatter",
			callback = function()
				local conform = require("conform")
				conform.format({
					async = false,
					lsp_format = "nerver",
				})
			end,
		})
	end,
}
