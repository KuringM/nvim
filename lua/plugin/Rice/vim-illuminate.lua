return {
	"RRethy/vim-illuminate", -- automatically highlighting other uses of the current word under the cursor.
	config = function()
		require("illuminate").configure({
			providers = {
				"regex",
				"lsp",
				"treesitter",
			},
		})
		vim.cmd("hi IlluminatedWordText guibg=#393E4D gui=none")
		vim.api.nvim_set_keymap("n", "<leader>=", "", {
			noremap = true,
			callback = function()
				require("illuminate").goto_next_reference(wrap)
			end,
		})
		vim.api.nvim_set_keymap("n", "<leader>-", "", {
			noremap = true,
			callback = function()
				require("illuminate").goto_prev_reference(wrap)
			end,
		})
	end,
}
