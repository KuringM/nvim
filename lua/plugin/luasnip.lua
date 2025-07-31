-- https://github.com/L3MON4D3/LuaSnip
-- Snippet Engine for Neovim written in Lua.

return {
	"L3MON4D3/LuaSnip",
	build = "make install_jsregexp",
	dependencies = {
		{
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				-- require("luasnip.loaders.from_snipmate").lazy_load({ paths = "./UltiSnips" })
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
			updateevents = "TextChanged,TextChangedI",
			enable_autosnippets = true, -- Enable autotriggered snippets
			store_selection_keys = "<Tab>", -- Use Tab (or some other key if you prefer) to trigger visual selection
		})

		require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/LuaSnips/" })
		require("luasnip").filetype_extend("markdown", { "tex" })
	end,
}
