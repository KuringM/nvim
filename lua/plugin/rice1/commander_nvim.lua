return {
	"FeiyouG/commander.nvim", -- Create and manage keybindings and commands in a more organized manner, and search them quickly through Telescope
	config = function()
		local commander = require("commander")
		commander.setup({
			telescope = {
				enable = true,
			},
		})
		vim.keymap.set("n", "<c-q>", require("commander").show, { noremap = true, nowait = true })
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
	end,
}
