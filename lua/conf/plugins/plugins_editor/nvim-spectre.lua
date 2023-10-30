return{
	"nvim-pack/nvim-spectre",  -- Find the enemy and replace them with dark power.
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
