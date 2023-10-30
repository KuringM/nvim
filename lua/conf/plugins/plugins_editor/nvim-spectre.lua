return{
	"nvim-pack/nvim-spectre",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<leader>F",
			mode = "n",
			function()
				require("spectre").open()
			end,
			desc = "Project find and replace"
		}
	}
}
