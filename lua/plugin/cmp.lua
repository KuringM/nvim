local config = {}

-- Performant, batteries-included completion plugin for Neovim
config.blinkcmp = {
	"saghen/blink.cmp",
	version = "1.*",
	opts = {
		keymap = {
			preset = "none",
			["<C-N>"] = { "select_prev", "fallback" },
			["<C-I>"] = { "select_next", "fallback" },
			["<C-E>"] = { "select_and_accept", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		cmdline = {
			-- keyword = { preset = "none" }
		}, -- disable cmdline

		completion = {
			keyword = { range = "prefix" },
			menu = {
				draw = {
					treesitter = { "lsp" },
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
					},
				},
			},
			trigger = { show_on_trigger_character = true },
			documentation = {
				auto_show = true,
			},
			ghost_text = { enabled = true },
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		snippets = { preset = "luasnip" },

		fuzzy = { implementation = "prefer_rust_with_warning" },

		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}

-- Bring enjoyment to your auto completion.
config.colorfulmenu = {
	"xzbdmw/colorful-menu.nvim",
	config = function()
		vim.g.blinkcmp_disable_cmdline = true
		require("blink.cmp").setup({
			completion = {
				menu = {
					draw = {
						columns = { { "kind_icon" }, { "label", gap = 1 } },
						components = {
							label = {
								text = function(ctx)
									return require("colorful-menu").blink_components_text(ctx)
								end,
								highlight = function(ctx)
									return require("colorful-menu").blink_components_highlight(ctx)
								end,
							},
						},
					},
				},
			},
		})
	end,
}

return {
	config.blinkcmp,
	config.colorfulmenu,
}
