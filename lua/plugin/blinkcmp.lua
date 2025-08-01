-- https://github.com/saghen/blink.cmp
-- Performant, batteries-included completion plugin for Neovim

local blinkcmp_opts = {
	keymap = {
		preset = "none",
		["<C-N>"] = { "select_prev", "fallback" },
		["<C-I>"] = { "select_next", "fallback" },
		["<C-E>"] = {
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
			preselect = false,
			auto_insert = false,
		} },
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	snippets = { preset = "luasnip" },

	fuzzy = { implementation = "prefer_rust_with_warning" },

	signature = { enabled = true },
}

return {
	"saghen/blink.cmp",
	version = "1.*",
	opts = blinkcmp_opts,
	opts_extend = { "sources.default" },
}
