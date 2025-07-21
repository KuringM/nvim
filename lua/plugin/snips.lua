local config = {}

-- Snippet Engine for Neovim written in Lua.
config.luaSnip = {
	"L3MON4D3/LuaSnip",
	event = "InsertEnter",
	dependencies = {
		-- 可选：加载 vsnip 格式的 snippets（如 vim-snippets）
		{
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_snipmate").lazy_load({ paths = "./snips" })
			end,
		},
	},
	config = function()
		local ls = require("luasnip")

		vim.keymap.set({ "i", "s" }, "<C-e>", function()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<C-u>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, { silent = true })

		ls.config.set_config({
			history = true,
			updateevents = "TextChanged,TextChangedI",
			enable_autosnippets = true,
		})
	end,
}

-- UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
config.ultisnips = {
	"SirVer/ultisnips",
	-- event = "InsertEnter",
	dependencies = {
		"honza/vim-snippets",
	},
	config = function()
		vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "vim-snippets", "snips", "snips/tex" }
		vim.keymap.del("i", "<C-U>")
		vim.g.UltiSnipsExpandTrigger = "<c-e>"
		vim.g.UltiSnipsJumpOrExpandTrigger = "<c-e>"
		vim.g.UltiSnipsJumpForwardTrigger = "<c-e>"
		vim.g.UltiSnipsJumpBackwardTrigger = "<c-u>"
	end,
}

return {
	-- config.luaSnip,
	config.ultisnips,
}
