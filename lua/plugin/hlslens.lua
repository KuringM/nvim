-- https://github.com/kevinhwang91/nvim-hlslens
-- Hlsearch Lens for Neovim

return {
	"kevinhwang91/nvim-hlslens",
	config = function()
		require("hlslens").setup({
			build_position_cb = function(plist, _, _, _)
				require("scrollbar.handlers.search").handler.show(plist.start_pos)
			end,
		})
		local kopts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap(
			"n",
			"=",
			[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
			kopts
		)
		vim.api.nvim_set_keymap(
			"n",
			"-",
			[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
			kopts
		)
		vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap("n", "<Leader><CR>", "<Cmd>noh<CR>", kopts)
	end,
}
