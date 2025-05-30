return {
	-- markdown preview plugin for (neo)vim
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
		config = function()
			vim.cmd([[
				let g:mkdp_auto_close = 0
				let g:mkdp_images_path = "./Accessory"
				let g:mkdp_preview_options = {
						\ 'mkit': {},
						\ 'katex': {},
						\ 'uml': {},
						\ 'maid': {},
						\ 'disable_sync_scroll': 0,
						\ 'sync_scroll_type': 'middle',
						\ 'hide_yaml_meta': 1,
						\ 'sequence_diagrams': {},
						\ 'flowchart_diagrams': {},
						\ 'content_editable': v:false,
						\ 'disable_filename': 0,
						\ 'toc': {},
						\ }
				set updatetime=100
			]])
		end,
	},

	-- VIM Table Mode for instant table creation.
	{
		"dhruvasagar/vim-table-mode",
		cmd = { "TableModeToggle" },
		ft = { "text", "markdown" },
		config = function()
			vim.cmd([[
				noremap <LEADER>tm :TableModeToggle<CR>
				let g:table_mode_cell_text_object_i_map = 'k<Bar>'
			]])
		end,
	},

	-- A vim 7.4+ plugin to generate table of contents for Markdown files.
	{
		"mzlogin/vim-markdown-toc",
		ft = { "gitignore", "markdown" },
		config = function()
			vim.g.vmt_cycle_list_item_markers = 1
			vim.g.vmt_fence_text = "TOC"
			vim.g.vmt_fence_closing_text = "/TOC"
		end,
	},

	-- 🔫Bullets.vim is a Vim/NeoVim plugin for automated bullet lists.
	{
		"dkarter/bullets.vim",
		lazy = false,
		ft = { "markdown", "txt" },
	},

	{
		"preservim/vim-markdown",
		config = function()
			vim.g.vim_markdown_math = 1
		end,
	},
}
