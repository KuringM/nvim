local config = {}

local function nvimcmp_cfg()
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
end

config.nvimcmp = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
	},
	config = nvimcmp_cfg,
}

return {
	config.nvimcmp,
}
