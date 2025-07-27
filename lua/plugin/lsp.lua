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
		-- local mason_lspconfig = require("mason-lspconfig")
		-- local lspconfig = require("lspconfig")
		--
		-- -- 自动安装指定的服务器
		-- mason_lspconfig.setup({
		-- 	ensure_installed = opts.ensure_installed,
		-- })

		-- local on_attach = function(client, bufnr)
		-- 	local buf_map = function(mode, lhs, rhs, desc)
		-- 		if desc then
		-- 			desc = "LSP: " .. desc
		-- 		end
		-- 		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
		-- 	end
		--
		-- 	buf_map("n", "<LEADER>h", vim.lsp.buf.hover, "Hover Documentation")
		-- 	buf_map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
		-- 	buf_map("n", "gr", vim.lsp.buf.references, "References")
		-- 	buf_map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
		-- 	buf_map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
		-- 	buf_map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
		-- 	-- 你可以继续添加更多快捷键
		-- end
		--
		-- -- 配置每个自动安装的 LSP
		-- for _, server in ipairs(opts.ensure_installed) do
		-- 	lspconfig[server].setup({
		-- 		on_attach = on_attach,
		-- 		flags = { debounce_text_changes = 150 },
		-- 		settings = server == "lua_ls" and {
		-- 			Lua = {
		-- 				-- diagnostics = { globals = { "vim" } },
		-- 				workspace = { checkThirdParty = false },
		-- 			},
		-- 		} or nil,
		-- 	})
		-- end
	end,
}

return {
	config.mason,
}
