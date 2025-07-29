local config = {}

config.nvimcmp = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- 支持 luasnip
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<C-i>"] = cmp.mapping.select_next_item(),
				["<C-n>"] = cmp.mapping.select_prev_item(),
				-- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
				-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-y>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- 确认选择
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
				{ name = "path" },
			}),

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			formatting = {
				format = function(entry, vim_item)
					-- 可选:添加补全来源标识
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						buffer = "[Buf]",
						path = "[Path]",
						luasnip = "[Snip]",
					})[entry.source.name]
					return vim_item
				end,
			},
		})
	end,
}

-- Performant, batteries-included completion plugin for Neovim
config.blinkcmp = {
	"saghen/blink.cmp",
	version = "1.*",
	opts = {
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
	-- config.colorfulmenu,	
	-- config.nvimcmp
}
