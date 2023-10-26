return
{ -- automatically highlighting other uses of the current word under the cursor.
	"RRethy/vim-illuminate",
	config = function()
		require('illuminate').configure({
			providers = {
				-- 'lsp',
				-- 'treesitter',
				'regex',
			},
		})
		vim.cmd("hi IlluminatedWordText guibg=#393E4D gui=none")
	end
}
