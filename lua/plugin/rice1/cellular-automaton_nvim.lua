return {
	"Eandrju/cellular-automaton.nvim",  -- A useless plugin that might help you cope with stubbornly broken tests or overall lack of sense in life. It lets you execute aesthetically pleasing, cellular automaton animations based on the content of neovim buffer.
	keys = "<leader>rr",
	config = function()
		-- vim.keymap.set("n", "<leader>rr", "<cmd>CellularAutomaton make_it_rain<CR>")
		vim.keymap.set("n", "<leader>rr", "<cmd>CellularAutomaton game_of_life<CR>")
	end,
}
