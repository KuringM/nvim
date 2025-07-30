local config = {}

local blinkcmp_opts = {
	keymap = {
		preset = "none",
		["<C-N>"] = { "select_prev", "fallback" },
		["<C-I>"] = { "select_next", "fallback" },
		["<Tab>"] = {
			function(cmp)
				if cmp.snippet_active() then
					return cmp.accept()
				else
					return cmp.select_and_accept()
				end
			end,
			"snippet_forward",
			"fallback",
		},
	},

	appearance = {
		nerd_font_variant = "mono",
	},

	cmdline = {
		enabled = false,
		keyword = { preset = "none" },
	}, -- disable cmdline

	completion = {
		keyword = { range = "prefix" },
		menu = {
			draw = {
				treesitter = { "lsp" },
				columns = {
					{ "label", "label_description", gap = 1 },
					{ "kind_icon", gap = 1, "kind" },
				},
			},
		},
		trigger = { show_on_trigger_character = true },
		documentation = {
			auto_show = true,
		},
		list = { selection = {
			preselect = true,
			auto_insert = true,
		} },
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	snippets = { preset = "luasnip" },

	fuzzy = { implementation = "prefer_rust_with_warning" },

	signature = { enabled = true },
}

-- Performant, batteries-included completion plugin for Neovim
config.blinkcmp = {
	"saghen/blink.cmp",
	version = "1.*",
	opts = blinkcmp_opts,
	opts_extend = { "sources.default" },
}

local function colorfulmenu_cfg()
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
end

-- Bring enjoyment to your auto completion.
config.colorfulmenu = {
	"xzbdmw/colorful-menu.nvim",
	config = colorfulmenu_cfg,
}

return {
	config.blinkcmp,
	-- config.colorfulmenu,
}
