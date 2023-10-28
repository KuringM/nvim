return
{
	"FeiyouG/commander.nvim",
	config = function()
		local commander = require("commander")
		commander.setup({
			telescope = {
				enable = true,
			},
		})
		vim.keymap.set('n', '<c-q>', require("commander").show, m)
		commander.add({
			{
				desc = "Run Simulator",
				cmd = "<CMD>Telescope simulators run<CR>",
			},
			{
				desc = "Git diff",
				cmd = "<CMD>Telescope git_status<CR>",
			},
		})
	end
}
