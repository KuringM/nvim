local config = {}

-- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
config.mason = {

	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} }, -- Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.
		"neovim/nvim-lspconfig", -- Quickstart configs for Nvim LSP
	},
	opts = {
		ensure_installed = { "lua_ls", "bashls" },
	},
	config = function()
		-- Remove Global Default Key mapping
		vim.keymap.del("n", "grn")
		vim.keymap.del("n", "gra")
		vim.keymap.del("n", "grr")
		vim.keymap.del("n", "gri")
		vim.keymap.del("n", "gO")

		-- Create keymapping
		-- LspAttach: After an LSP Client performs "initialize" and attaches to a buffer.
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local keymap = vim.keymap
				local lsp = vim.lsp
				local bufopts = { noremap = true, silent = true }

				-- keymap.set("n", "gr", lsp.buf.references, bufopts)
				-- keymap.set("n", "gd", lsp.buf.definition, bufopts)
				-- keymap.set("n", "<space>rn", lsp.buf.rename, bufopts)
				-- keymap.set("n", "K", lsp.buf.hover, bufopts)
				-- keymap.set("n", "<space>f", function()
				-- 	require("conform").format({ async = true, lsp_fallback = true })
				-- end, bufopts)
			end,
		})
	end,
}

return {
	config.mason,
}
