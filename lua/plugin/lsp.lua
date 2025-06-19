return {
	-- Quickstart configs for Nvim LSP
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		lspconfig.pyright.setup({ capabilities = capabilities }) -- Python
		lspconfig.tsserver.setup({ capabilities = capabilities }) -- JS/TS
		lspconfig.gopls.setup({ capabilities = capabilities }) -- Go
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
				},
			},
		})
	end,
}
