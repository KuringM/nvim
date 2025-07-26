local config = {}

-- markdown preview plugin for (neo)vim
config.markdownPreview = {
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
}

-- VIM Table Mode for instant table creation.
config.mdTableMode = {
	"dhruvasagar/vim-table-mode",
	cmd = { "TableModeToggle" },
	ft = { "text", "markdown" },
	config = function()
		vim.cmd([[
				noremap <LEADER>tm :TableModeToggle<CR>
				let g:table_mode_cell_text_object_i_map = 'k<Bar>'
			]])
	end,
}

-- A vim 7.4+ plugin to generate table of contents for Markdown files.
config.mdToc = {
	"mzlogin/vim-markdown-toc",
	ft = { "gitignore", "markdown" },
	config = function()
		vim.g.vmt_cycle_list_item_markers = 1
		vim.g.vmt_fence_text = "TOC"
		vim.g.vmt_fence_closing_text = "/TOC"
	end,
}

-- 🔫Bullets.vim is a Vim/NeoVim plugin for automated bullet lists.
config.bullets = {
	"dkarter/bullets.vim",
	lazy = false,
	ft = { "markdown", "txt" },
}

-- Markdown Vim Mode
config.vimMarkdown = {
	"preservim/vim-markdown",
	config = function()
		-- support vimtex "vimtex#syntax#in_mathzone()" for ultisnips
		vim.g.vim_markdown_math = 1
	end,
}

-- A lightweight Markdown → HTML converter for Neovim, with built-in MathJax support.
config.md2html = {
	"KuringM/md2html-nvim",
	cmd = "MdToHtml",
}

return {
	config.markdownPreview,
	config.mdTableMode,
	config.mdToc,
	-- config.bullets,
	config.vimMarkdown,
	config.md2html,
}
