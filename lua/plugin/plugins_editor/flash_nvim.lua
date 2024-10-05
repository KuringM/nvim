return {
	"folke/flash.nvim", -- Navigate your code with search labels, enhanced character motions and Treesitter integration
	event = "VeryLazy",
	opts = {
		search = {
			mode = "fuzzy",
		},
		label = {
			style = "overlay", ---@type "eol" | "overlay" | "right_align" | "inline" -- position of the label extmark
			reuse = "all", ---@type "lowercase" | "all"
			rainbow = {
				enabled = true,
				shade = 8,
			},
		},
	},
	keys = {
		{
			"<ESC>",
			mode = { "n" },
			function()
				require("flash").jump({
					remote_op = {
						restore = true,
						motion = true,
					},
				})
			end,
			desc = "Flash",
		},
		{
			"T",
			mode = { "n", "o", "x" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		{
			"/",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Flash Treesitter Search",
		},
	},
}
