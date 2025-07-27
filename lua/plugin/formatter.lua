local config = {}

-- Lightweight yet powerful formatter plugin for Neovim
config.conform = {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	build = {
		"brew install fsouza/prettierd/prettierd",
		"brew install stylua",
		"brew install deno",
		"brew install clang-format",
		"brew install tex-fmt",
		"pip install beautysh",
	},
	config = function()
		require("conform").setup({
			format_on_save = function(bufnr)
				local focus_filetypes = { "markdown" }
				if vim.tbl_contains(focus_filetypes, vim.bo[bufnr].filetype) then
					return { timeout_ms = 500, lsp_format = "fallback" }
				end
			end,
			formatters_by_ft = {
				sh = { "beautysh" },
				bash = { "beautysh" },
				zsh = { "beautysh" },
				cpp = { "clang-format" },
				css = { "prettierd" },
				html = { "texfmt", "injected", "prettierd" },
				json = { "prettierd" },
				jsonc = { "prettierd" },
				lua = { "stylua" },
				rust = { "rustfmt" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				yaml = { "prettierd" },
				go = {
					formatters = { "gofumpt", "goimports" },
					run_all_formatters = true,
				},
				python = { "black" },
				markdown = {
					-- "texfmt",
					"injected",
					"prettierd",
				},
				tex = { "tex-fmt", stop_after_first = true },
			},
			formatters = {
				texfmt = {
					command = "/opt/homebrew/bin/tex-fmt",
				},
			},
		})
		-- Customize the "tex-fmt" formatter
		require("conform").formatters.texfmt = {
			inherit = true,
			command = "tex-fmt",
			args = { "-s", "-n", "--usetabs", "--tabsize", "1" },
		}
		-- Customize the "injected" formatter
		require("conform").formatters.injected = {
			options = {
				ignore_errors = false,
				lang_to_ft = {
					bash = "sh",
					markdown = "md",
				},
				lang_to_ext = {
					latex = "tex",
					markdown = "md",
				},
				lang_to_formatters = {},
			},
		}
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
		-- Auto-format when focus is lost or I leave the buffer
		vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
			pattern = { "*.md" },
			callback = function(args)
				local buf = args.buf or vim.api.nvim_get_current_buf()
				if vim.fn.mode():match("^n") then
					vim.defer_fn(function()
						if vim.api.nvim_buf_is_valid(buf) then
							require("conform").format({ bufnr = buf })
						end
					end, 100)
				end
			end,
		})
	end,
}

-- vim script for text filtering and alignment
config.tabular = {
	"godlygeek/tabular",
	keys = { { "\\t", mode = { "n", "v" } } },
	config = function()
		vim.keymap.set(
			"v",
			[[\t]],
			[[:'<,'>Tabularize //l1l1l1<left><left><left><left><left><left><left>]],
			{ noremap = true }
		)
		vim.keymap.set(
			"n",
			[[\t]],
			[[:Tabularize //l1l1l1<left><left><left><left><left><left><left>]],
			{ noremap = true }
		)

		vim.cmd([[
			" Aligning text with <Leader>a
			if exists(":Tabularize")
				noremap  <Leader>a= :Tabularize /=/l1l1l1<CR>
				vnoremap <Leader>a= :Tabularize /=/l1l1l1<CR>
				noremap  <Leader>a: :Tabularize /:\zs/l1l1l1<CR>
				vnoremap <Leader>a: :Tabularize /:\zs/l1l1l1<CR>
				noremap  <Leader>a, :Tabularize /,\zs/l1l1l1<CR>
				vnoremap <Leader>a, :Tabularize /,\zs/l1l1l1<CR>
				noremap  <Leader>a-- :Tabularize /--/l1l1l1<CR>
				vnoremap <Leader>a-- :Tabularize /--/l1l1l1<CR>
				noremap  <Leader>a// :Tabularize ////l1l1l1<CR>
				vnoremap <Leader>a// :Tabularize ////l1l1l1<CR>
			endif
			AddTabularPattern! first_comma /^[^,]*\zs,/l1l1l1
			AddTabularPattern! first_< /^[^<]*\zs</l1l1l1
			AddTabularPattern! first_= /^[^=]*\zs</l1l1l1
			AddTabularPattern! first_-- /^[^--]*\zs</l1l1l1
			AddTabularPipeline! multiple_spaces / \{2,}/
			\ map(a:lines, "substitute(v:val, ' \{2,}', '  ', 'g')")
			\   | tabular#TabularizeStrings(a:lines, '  ', 'l0')
		]])
	end,
}

return {
	config.conform,
	config.tabular,
}
