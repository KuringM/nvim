local config = {}

-- Snippet Engine for Neovim written in Lua.
config.luaSnip = {
	"L3MON4D3/LuaSnip",
	event = "InsertEnter",
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
			history = true,
			updateevents = "TextChanged,TextChangedI",
			enable_autosnippets = true, -- Enable autotriggered snippets
			store_selection_keys = "<Tab>", -- Use Tab (or some other key if you prefer) to trigger visual selection
		})

		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnips/" })
	end,
}

-- UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
config.ultisnips = {
	"SirVer/ultisnips",
	dependencies = {
		"honza/vim-snippets",
	},
	config = function()
		vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "UltiSnips/tex", "vim-snippets" }
		vim.g.UltiSnipsExpandTrigger = "<C-E>"
		vim.g.UltiSnipsExpandOrJumpTrigger = "<C-E>"
		vim.g.UltiSnipsJumpOrExpandTrigger = "<C-E>"
		vim.g.UltiSnipsJumpForwardTrigger = "<C-E>"
		vim.keymap.set("i", "<C-U>", "<Nop>", { noremap = true })
		vim.g.UltiSnipsJumpBackwardTrigger = "<C-U>"
	end,
}

-- Bundle snippets from multiple sources and convert them to your format of choice.
config.snipconverter = {
	"smjonas/snippet-converter.nvim",
	config = function()
		local template = {
			sources = {
				ultisnips = {
					"./vim-snippets/UltiSnips",
					"./latex-snippets/tex.snippets",
					vim.fn.stdpath("config") .. "/UltiSnips",
				},
			},
			output = {
				vscode_luasnip = {
					vim.fn.stdpath("config") .. "/luasnip_snippets",
				},
			},
		}

		require("snippet_converter").setup({
			templates = { template },
		})
	end,
}

return {
	-- config.luaSnip,
	config.ultisnips,
}
