local G = require("G")

return {
	"neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
	lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
	dependencies = {
		-- main one
		{ "ms-jpq/coq_nvim", branch = "coq" },

		-- 9000+ Snippets
		{ "ms-jpq/coq.artifacts", branch = "artifacts" },

		-- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
		-- Need to **configure separately**
		{ "ms-jpq/coq.thirdparty", branch = "3p" },
		-- - shell repl
		-- - nvim lua api
		-- - scientific calculator
		-- - comment banner
		-- - etc
	},
	init = function()
		vim.g.coq_settings = {
			auto_start = true,
			keymap = {
				recommended = false,
				manual_complete = "<c-o>",
				bigger_preview = "<c-k>",
				jump_to_mark = "<c-e>",
			},
		}

		G.map({
			{ "i", "<Esc>", [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]], { expr = true, silent = true } },
			-- { "i", "<C-c>", [[pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]], { expr = true, silent = true } },
			-- { "i", "<BS>", [[pumvisible() ? "\<C-e><BS>" : "\<BS>"]], { expr = true, silent = true } },
			{
				"i",
				"<CR>",
				[[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
				{ expr = true, silent = true },
			},
			{ "i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, silent = true } },
			{ "i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true } },
			{ "i", "<c-n>", [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true } }, -- does not work
		})
	end,
	config = function()
		-- Your LSP settings here
		-- req
	end,
}
