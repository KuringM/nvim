local config = {}

local function is_nvim_config_lua()
	return vim.bo.filetype == "lua" and vim.api.nvim_buf_get_name(0):find(vim.fn.stdpath("config"), 1, true)
end

function _G.show_docs()
	local ft = vim.bo.filetype
	local cw = vim.fn.expand("<cword>")

	-- 如果是 help/vim/lua config 文件, 用内置帮助
	if ft == "help" or ft == "vim" or (ft == "lua" and is_nvim_config_lua()) then
		vim.cmd("h " .. cw)
		return
	end

	-- 优先使用 Neovim 内置 LSP hover
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if next(clients) ~= nil then
		vim.lsp.buf.hover()
		return
	end

	-- fallback: keywordprg
	vim.cmd("!" .. vim.o.keywordprg .. " " .. cw)
end

----------------------------------------------------------------------
-- on_attach: 每个 LSP 启动时执行的设置
----------------------------------------------------------------------

local function on_attach(client, bufnr)
	-- vim.notify("LSP attached to buffer: " .. bufnr .. " (client: " .. client.name .. ")", vim.log.levels.INFO)

	local function map(mode, lhs, rhs, desc)
		if desc then
			desc = "LSP: " .. desc
		end
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
	end

	-- Remove Global Default Key mapping
	vim.keymap.del("n", "grn")
	vim.keymap.del("n", "gra")
	vim.keymap.del("n", "grr")
	vim.keymap.del("n", "gri")
	vim.keymap.del("n", "grt")
	vim.keymap.del("n", "gO")
	-- 常用导航
	map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
	map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
	map("n", "gr", vim.lsp.buf.references, "References")
	map("n", "gi", vim.lsp.buf.implementation, "Implementation")
	map("n", "gt", vim.lsp.buf.type_definition, "Type Definition")

	-- 代码操作
	if client.server_capabilities.renameProvider then
		map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
	end

	if client.server_capabilities.codeActionProvider then
		map({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, "Code Action")
	end

	-- 文档与帮助
	vim.keymap.set("n", "<leader>h", _G.show_docs, { desc = "Show documentation" })
	-- if client.server_capabilities.hoverProvider then
	-- 	map("n", "<leader>h", vim.lsp.buf.hover, "Hover Documentation")
	-- end

	if client.server_capabilities.signatureHelpProvider then
		map("i", "<C-h>", vim.lsp.buf.signature_help, "Signature Help")
	end

	-- 格式化
	if client.server_capabilities.documentFormattingProvider then
		map("n", "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, "Format Document")
	elseif client.server_capabilities.documentRangeFormattingProvider then
		map("v", "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, "Format Range")
	end

	-- 诊断导航
	map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
	map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
	map("n", [[\e]], vim.diagnostic.open_float, "Show Diagnostic")

	-- 其他常用 LSP 功能(按需打开)
	-- map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add Workspace Folder")
	-- map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder")
	-- map("n", "<leader>wl", function()
	--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, "List Workspace Folders")
end

-- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
config.mason = {

	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} }, -- Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.
		"neovim/nvim-lspconfig", -- Quickstart configs for Nvim LSP
	},
	opts = {
		-- mason 自动安装的语言服务器
		ensure_installed = {
			"lua_ls",
			"bashls",
			"pyright",
			"clangd",
			"jsonls",
			"html",
		},
	},
	config = function()
		----------------------------------------------------------------------
		-- 每个 language server 的通用设置
		----------------------------------------------------------------------
		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- local capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		local mason_lspconfig = require("mason-lspconfig")
		local lspconfig = require("lspconfig")
		for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
			local opts = {
				capabilities = capabilities,
				on_attach = on_attach,
			}

			if server_name == "lua_ls" then
				opts.settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				}
			end

			lspconfig[server_name].setup(opts)
		end

		vim.api.nvim_create_user_command("DisableDiag", function()
			vim.diagnostic.enable(false, { bufnr = 0 })
		end, { desc = "Disable diagnostics for current buffer" })

		vim.api.nvim_create_user_command("EnableDiag", function()
			vim.diagnostic.enable(true, { bufnr = 0 })
		end, { desc = "Enable diagnostics for current buffer" })
		----------------------------------------------------------------------
		-- 美化诊断图标
		----------------------------------------------------------------------
		vim.diagnostic.config({
			virtual_text = true,
			update_in_insert = false,
			underline = true,
			severity_sort = true,
			float = {
				border = "rounded",
				source = "always",
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.HINT] = "",
					[vim.diagnostic.severity.INFO] = "",
				},
			},
		})
	end,
}

return {
	config.mason,
}
