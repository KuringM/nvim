return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"SirVer/ultisnips",
		{
			"quangnguyen30192/cmp-nvim-ultisnips", -- nvim-cmp source for ultisnips
			config = function()
				require("cmp_nvim_ultisnips").setup({})
			end,
		},
	},
	event = { "InsertEnter", "CmdlineEnter" },
	config = function()
		local cmp = require("cmp")
		local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping(function(fallback)
					cmp_ultisnips_mappings.jump_forwards(fallback)
				end, {
					"i",
					"s", --[[ "c" (to enable the mapping in command mode) ]]
				}),
				["<C-N>"] = cmp.mapping(function(fallback)
					cmp_ultisnips_mappings.jump_backwards(fallback)
				end, {
					"i",
					"s", --[[ "c" (to enable the mapping in command mode) ]]
				}),
				["<C-E>"] = cmp.mapping(function(fallback)
					cmp_ultisnips_mappings.expand(fallback)
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "ultisnips" }, -- For ultisnips users.
			}, {
				{ name = "buffer" },
			}),
		})
		-- Use buffer source for `/`.
		cmp.setup.cmdline("/", {
			completion = { autocomplete = false },
			sources = {
				-- { name = 'buffer' }
				{ name = "buffer", opts = { keyword_pattern = [=[[^[:blank:]].*]=] } },
			},
		})

		-- Use cmdline & path source for ':'.
		cmp.setup.cmdline(":", {
			completion = { autocomplete = false },
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}
