return {
	{
		"instant-markdown/vim-instant-markdown",
		ft = { "markdown" },
		build = "yarn install",
		config = function()
			vim.g.instant_markdown_autostart = 0
		end,
	},
}
--[[
{
	'iamcco/markdown-preview.nvim', 
	{ 'do': 'cd app && yarn install'  }
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
		let g:mkdp_filetypes = ['markdown']
		set updatetime=100
}

Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }  " VIM Table Mode for instant table creation.
	noremap <LEADER>tm :TableModeToggle<CR>
	"let g:table_mode_disable_mappings = 1
	let g:table_mode_cell_text_object_i_map = 'k<Bar>'

Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }                        " A vim 7.4+ plugin to generate table of contents for Markdown files.
	"let g:vmt_auto_update_on_save = 0
	"let g:vmt_dont_insert_fence = 1
	let g:vmt_cycle_list_item_markers = 1
	let g:vmt_fence_text = 'TOC'
	let g:vmt_fence_closing_text = '/TOC'
]]--
