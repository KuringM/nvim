return {
	{
		"iamcco/markdown-preview.nvim", -- markdown preview plugin for (neo)vim
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
		config = function()
			vim.cmd([[
				let g:mkdp_auto_start = 0
				let g:mkdp_auto_close = 0
				let g:mkdp_refresh_slow = 0
				let g:mkdp_command_for_global = 0
				let g:mkdp_open_to_the_world = 0
				" let g:mkdp_open_ip = ''
				" let g:mkdp_browser = ''
				let g:mkdp_echo_preview_url = 0
				" let g:mkdp_browserfunc = ''
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
						\ 'disable_filename': 0
						\ }
				let g:mkdp_markdown_css = ''
				let g:mkdp_highlight_css = ''
				let g:mkdp_port = ''
				let g:mkdp_page_title = '「${name}」'
				" let g:mkdp_filetypes = ['markdown']
				set updatetime=100
			]])
		end,
	},
	{
		"dhruvasagar/vim-table-mode", -- VIM Table Mode for instant table creation.
		cmd = { "TableModeToggle" },
		ft = { "text", "markdown" },
		config = function()
			vim.cmd([[
				noremap <LEADER>tm :TableModeToggle<CR>
				"let g:table_mode_disable_mappings = 1
				let g:table_mode_cell_text_object_i_map = 'k<Bar>'
			]])
		end,
	},
	{
		"mzlogin/vim-markdown-toc", -- A vim 7.4+ plugin to generate table of contents for Markdown files.
		ft = { "gitignore", "markdown" },
		config = function()
			-- vim.g.vmt_auto_update_on_save = 0
			-- vim.g.vmt_dont_insert_fence = 1
			vim.g.vmt_cycle_list_item_markers = 1
			vim.g.vmt_fence_text = "TOC"
			vim.g.vmt_fence_closing_text = "/TOC"
		end,
	},
	{
		"dkarter/bullets.vim", -- 🔫Bullets.vim is a Vim/NeoVim plugin for automated bullet lists.
		lazy = false,
		ft = { "markdown", "txt" },
	},
	-- {
	-- 	"instant-markdown/vim-instant-markdown", -- Instant Markdown previews from Vim
	-- 	ft = { "markdown" },
	-- 	build = "yarn install",
	-- 	config = function()
	-- 		vim.g.instant_markdown_autostart = 0
	-- 	end,
	-- },
	-- {
	-- 	"lukas-reineke/headlines.nvim",
	-- 	ft = "markdown",
	-- 	config = function()
	-- 		vim.cmd([[highlight Headline1 guibg=#1e2718]])
	-- 		vim.cmd([[highlight Headline2 guibg=#21262d]])
	-- 		vim.cmd([[highlight CodeBlock guibg=#1c1c1c]])
	-- 		vim.cmd([[highlight Dash guibg=#D19A66 gui=bold]])
	--
	-- 		require("headlines").setup({
	-- 			org = {
	-- 				headline_highlights = { "Headline1", "Headline2" },
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
