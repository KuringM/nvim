return {
	"stevearc/conform.nvim", -- -- Lightweight yet powerful formatter plugin for Neovim
	event = "VeryLazy",
	build = {
		"brew install fsouza/prettierd/prettierd",
		"brew install stylua",
	},
	config = function()
		-- local status, conform = pcall(require, "conform")
		-- if not status then
		-- 		vim.notify("not found conform")
		-- 		return
		-- end

		require("conform").setup({
			formatters_by_ft = {
				c = { "clang_format" },
				go = {
					formatters = { "gofumpt", "goimports" },
					run_all_formatters = true,
				},
				html = { "prettierd" },
				json = { "prettierd" },
				jsonc = { "prettierd" },
				rust = { "rustfmt" },
				bash = { "shfmt" },
				lua = { "stylua" },
				-- Conform will use the first available formatter in the list
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				vue = { "prettierd" },
				-- Formatters can also be specified with additional options
				python = {
					formatters = { "isort", "black" },
					-- Run formatters one after another instead of stopping at the first success
					run_all_formatters = true,
				},
				zig = { "zigfmt" },
				markdown = {
					"prettierd",
					"markdownlint",
				},
			},
		})

		vim.api.nvim_set_keymap("n", [[\f]], "", {
			noremap = true,
			silent = true,
			callback = function()
				local conform = require("conform")
				conform.format({
					bufnr = buffer_id,
					async = false,
					lsp_fallback = true,
				})
			end,
		})
	end,
}
