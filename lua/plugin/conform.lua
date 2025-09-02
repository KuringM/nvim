-- https://github.com/stevearc/conform.nvim
-- Lightweight yet powerful formatter plugin for Neovim

local function conform_cfg()
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
			-- lua = { "lua-format" },
			rust = { "rustfmt" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			yaml = { "prettierd" },
			go = { "gofumpt", "goimports" },
			python = { "black" },
			markdown = {
				-- "texfmt",
				"injected",
				"prettierd",
			},
			tex = { "texfmt", stop_after_first = true },
		},
		formatters = {
			texfmt = {
				command = "/opt/homebrew/bin/tex-fmt",
				args = { "-s", "-n", "--usetabs", "--tabsize", "1" },
			},
		},
	})

	-- Customize the "injected" formatter
	require("conform").formatters.injected = {
		options = {
			ignore_errors = false,
			lang_to_ft = {
				bash = "sh",
				javascript = "javascript",
				typescript = "typescript",
				lua = "lua",
				c = "c",
				cpp = "clang-format",
				python = "python",
				latex = "tex",
				markdown = "md",
			},
			lang_to_ext = {
				latex = "tex",
				markdown = "md",
			},
			lang_to_formatters = {
				c = { "clang-format" },
				latex = { "texfmt" },
			},
		},
	}

	require("conform").formatters.texfmt = {
		command = "tex-fmt",
		args = { "-s", "-n", "--usetabs", "--tabsize", "1" },
	}

	vim.api.nvim_set_keymap("n", [[\f]], "", {
		noremap = true,
		silent = true,
		desc = "conform formatter",
		callback = function()
			local conform = require("conform")
			conform.format({
				async = false,
				lsp_format = "never",
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
end

return {
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
	config = conform_cfg,
}
