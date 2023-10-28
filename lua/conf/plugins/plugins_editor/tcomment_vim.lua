return{
	-- An extensible & universal comment vim-plugin that also handles embedded filetypes. in <space>cn to comment a line.
	"tomtom/tcomment_vim",
	event = "BufRead",
	config = function()
		vim.g.tcomment_maps = true
		vim.g.tcomment_textobject_inlinecomment = ''

		vim.cmd([[
			nmap <LEADER>cn g>c
			vmap <LEADER>cn g>
			nmap <LEADER>cu g<c
			vmap <LEADER>cu g<
			unmap ic
		]])
	end
}
