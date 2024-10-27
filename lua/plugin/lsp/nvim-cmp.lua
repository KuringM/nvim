return {
	"hrsh7th/nvim-cmp", -- A completion plugin for neovim coded in Lua.
	after = "SirVer/ultisnips",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-calc",
		-- "andersevenrud/cmp-tmux",
		{
			"onsails/lspkind.nvim",
			lazy = false,
			config = function()
				require("lspkind").init()
			end,
		},
		{
			"quangnguyen30192/cmp-nvim-ultisnips",
			dependencies = {
				"SirVer/ultisnips",
				"honza/vim-snippets",
			},
			config = function()
				require("cmp_nvim_ultisnips").setup({
					filetype_source = "ultisnips_default",
					show_snippets = "all",
					documentation = function(snippet)
						return snippet.description .. "\n\n" .. snippet.value
					end,
				})
				vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/Ultisnips" }
				vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
				vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
				vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
				vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
				vim.g.UltiSnipsRemoveSelectModeMappings = 0
			end,
		},
	},
	config = function()
		-- local G = require("G")
		local cmp = require("cmp")
		local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
				end,
			},
			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping(function(fallback)
					cmp_ultisnips_mappings.jump_forwards(fallback)
				end, {
					"i",
					"s", --[[ "c" (to enable the mapping in command mode) ]]
				}),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					cmp_ultisnips_mappings.jump_backwards(fallback)
				end, {
					"i",
					"s", --[[ "c" (to enable the mapping in command mode) ]]
				}),
				["<C-n>"] = cmp.mapping(function(fallback)
					cmp_ultisnips_mappings.jump_backwards(fallback)
				end, {
					"i",
					"s", --[[ "c" (to enable the mapping in command mode) ]]
				}),
				["<C-e>"] = cmp.mapping(function(fallback)
					cmp_ultisnips_mappings.compose({ "expand", "jump_forwards" })(function() end)
				end, {
					"i",
					"s", --[[ "c" (to enable the mapping in command mode) ]]
				}),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-o>"] = cmp.mapping.complete(),
				-- ["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "ultisnips" }, -- For ultisnips users.
			}, {
				{ name = "buffer" },
			}),
		})
	end,
}
