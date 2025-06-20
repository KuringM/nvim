return {
	-- Performant, batteries-included completion plugin for Neovim
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		opts = {

			keymap = {
				preset = "enter",
				["<C-N>"] = { "select_prev", "fallback" },
				["<C-I>"] = { "select_next", "fallback" },
				["<C-E>"] = { "select_and_accept", "fallback" },
				["<C-K>"] = { "show_signature", "hide_signature", "fallback" },
				["<C-O>"] = { "show_documentation", "fallback" },
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			cmdline = { enable = false }, -- disable cmdline

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

			fuzzy = { implementation = "prefer_rust_with_warning" },

			signature = { enabled = true },
		},
		opts_extend = { "sources.default" },
	},

	-- Bring enjoyment to your auto completion.
	{
		"xzbdmw/colorful-menu.nvim",
		config = function()
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
	},
}
