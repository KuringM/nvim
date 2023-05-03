" ===================== Install Plugins with Vim-Plug =====================

call plug#begin('~/.config/nvim/plugged')

"""""""""""""""""""""Pretty Dress""""""""""""""""""""""
Plug 'theniceboy/nvim-deus'                                    " vim theme
	set t_Co=256
	set termguicolors
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set background=dark    " Setting dark mode
	let g:deus_termcolors=256

" TODO: config eleline to show nvim modes  <03-03-23, Kuring> "
" Plug 'liuchengxu/eleline.vim'                                     " 🌿 Another elegant statusline for vim
" Plug 'kuringm/eleline.vim'                                     " 🌿 Another elegant statusline for vim
	let g:airline_powerline_fonts = 1

Plug 'glepnir/spaceline.vim'
let g:spaceline_custom_vim_status = {"n": "🅝 ","V":"🅥 ","v":"🅥 ","\<C-v>": "🅥 ","i":"🅘 ","R":"🅡 ","s":"🅢 ","t":"🅣 ","c":"🅒 ","!":"SE"}

Plug 'ojroques/vim-scrollstatus'                               " A scrollstatus for vim statuslin
	let g:scrollstatus_size = 20

Plug 'luochen1990/rainbow'                                     " Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration.
	let g:rainbow_active = 1
	let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'guis': [''],
	\	'cterms': [''],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'markdown': {
	\			'parentheses_options': 'containedin=markdownCode contained', 
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], 
	\		},
	\		'haskell': {
	\			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],  
	\		},
	\		'vim': {
	\			'parentheses_options': 'containedin=vimFuncBody', 
	\		},
	\		'perl': {
	\			'syn_name_prefix': 'perlBlockFoldRainbow', 
	\		},
	\		'stylus': {
	\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], 
	\		},
	\		'css': 0, 
	\	}
	\}

Plug 'mg979/vim-xtabline'                                      " Tabline customization with buffer filtering
	let g:xtabline_settings = {}
	let g:xtabline_settings.enable_mappings = 0
	let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
	let g:xtabline_settings.enable_persistance = 0
	let g:xtabline_settings.last_open_first = 1
	noremap to :XTabMode<CR>
	noremap \p :echo expand('%:p')<CR>

Plug 'ryanoasis/vim-devicons'                                  " Adds file type icons to Vim plugins
Plug 'wincent/terminus'                                        " Enhanced terminal integration for Vim
	let g:neoterm_autoscroll = 1
	autocmd TermOpen term://* startinsert
	let g:terminal_color_0  = '#000000'
	let g:terminal_color_1  = '#FF5555'
	let g:terminal_color_2  = '#50FA7B'
	let g:terminal_color_3  = '#F1FA8C'
	let g:terminal_color_4  = '#BD93F9'
	let g:terminal_color_5  = '#FF79C6'
	let g:terminal_color_6  = '#8BE9FD'
	let g:terminal_color_7  = '#BFBFBF'
	let g:terminal_color_8  = '#4D4D4D'
	let g:terminal_color_9  = '#FF6E67'
	let g:terminal_color_10 = '#5AF78E'
	let g:terminal_color_11 = '#F4F99D'
	let g:terminal_color_12 = '#CAA9FA'
	let g:terminal_color_13 = '#FF92D0'
	let g:terminal_color_14 = '#9AEDFE'
	tnoremap <C-N> <C-\><C-N>
	tnoremap <C-O> <C-\><C-N><C-O>

Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }      " asynchronously display the colours in file
	let g:Hexokinase_highlighters = ['backgroundfull']

Plug 'glepnir/dashboard-nvim', { 'branch': 'async-render' }    " nvim dashboard
	let g:dashboard_custom_header = [
	  \'               ▄▄██████████▄▄             ',
	  \'               ▀▀▀   ██   ▀▀▀             ',
	  \'       ▄██▄   ▄▄████████████▄▄   ▄██▄     ',
	  \'     ▄███▀  ▄████▀▀▀    ▀▀▀████▄  ▀███▄   ',
	  \'    ████▄ ▄███▀              ▀███▄ ▄████  ',
	  \'   ███▀█████▀▄████▄      ▄████▄▀█████▀███ ',
	  \'   ██▀  ███▀ ██████      ██████ ▀███  ▀██ ',
	  \'    ▀  ▄██▀  ▀████▀  ▄▄  ▀████▀  ▀██▄  ▀  ',
	  \'       ███           ▀▀           ███     ',
	  \'       ██████████████████████████████     ',
	  \'   ▄█  ▀██  ███   ██    ██   ███  ██▀  █▄ ',
	  \'   ███  ███ ███   ██    ██   ███▄███  ███ ',
	  \'   ▀██▄████████   ██    ██   ████████▄██▀ ',
	  \'    ▀███▀ ▀████   ██    ██   ████▀ ▀███▀  ',
	  \'     ▀███▄  ▀███████    ███████▀  ▄███▀   ',
	  \'       ▀███    ▀▀██████████▀▀▀   ███▀     ',
	  \'         ▀    ▄▄▄    ██    ▄▄▄    ▀       ',
	  \'               ▀████████████▀             ',
	\]
	let g:dashboard_default_executive = 'fzf'
	let g:dashboard_custom_shortcut={
	\ 'last_session'       : 'Null',
	\ 'find_history'       : 'Ctrl h',
	\ 'find_file'          : 'Ctrl p',
	\ 'new_file'           : ':enew',
	\ 'change_colorscheme' : ':Colors',
	\ 'find_word'          : 'Ctrl f',
	\ 'book_marks'         : 'Null',
	\ }

"""""""""""""""""""""Search"""""""""""""""""""
Plug 'yianwillis/vimcdoc'                                      " vim chinese doc
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                                        " fuzzy finder
	set rtp+=/usr/local/opt/fzf
	set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
	set rtp+=/home/kuring/.linuxbrew/opt/fzf
	" let g:fzf_preview_window = 'right:60%'
	let g:fzf_preview_window = ['right:60%', 'ctrl-/']
	let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
	let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
	
	function! s:list_buffers()
	  redir => list
	  silent ls
	  redir END
	  return split(list, "\n")
	endfunction
	
	function! s:delete_buffers(lines)
	  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
	endfunction
	
	command! BD call fzf#run(fzf#wrap({
	  \ 'source': s:list_buffers(),
	  \ 'sink*': { lines -> s:delete_buffers(lines) },
	  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
	\ }))
	noremap <c-d> :BD<CR>
	" noremap <silent> <C-p> :Files<CR>
	noremap <silent> <C-f> :Rg<CR>
	noremap <silent> <C-h> :History<CR>
	"noremap <C-t> :BTags<CR>
	noremap <silent> <C-l> :Lines<CR>
	noremap <silent> <C-w> :Buffers<CR>
	noremap <leader>; :History:<CR>

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }              " An efficient fuzzy finder that helps to locate files, buffers, mrus, gtags, etc. on the fly.
	let g:Lf_CacheDirectory = expand('~/.cache/leaderf')
	" let g:Lf_WindowPosition = 'popup'
	let g:Lf_PreviewInPopup = 1
	let g:Lf_fuzzyEngine_C = 1
	let g:Lf_PreviewCode = 1
	let g:Lf_ShowHidden = 1
	let g:Lf_ShowDevIcons = 1
	let g:Lf_UseMemoryCache = 0
	let g:Lf_UseCache = 0
	let g:Lf_UseVersionControlTool = 0
	let g:Lf_IgnoreCurrentBufferName = 1
	let g:Lf_WildIgnore = {
	        \ 'dir': ['.git', 'vendor', 'node_modules'],
	        \ 'file': ['__vim_project_root']
	        \}
	let g:Lf_CommandMap = {
	\   '<C-k>': ['<C-u>'],
	\   '<C-j>': ['<C-e>'],
	\   '<C-]>': ['<C-v>'],
	\   '<C-p>': ['<C-n>'],
	\}
	nnoremap <c-p> :Leaderf file<CR>

Plug 'kevinhwang91/rnvimr'                                     " use Ranger in a floating window
	let g:rnvimr_ex_enable = 1
	let g:rnvimr_pick_enable = 1
	" let g:rnvimr_draw_border = 0
	let g:rnvimr_bw_enable = 1
	highlight link RnvimrNormal CursorLine
	let g:rnvimr_action = {
	            \ '<C-t>': 'NvimEdit tabedit',
	            \ '<C-x>': 'NvimEdit split',
	            \ '<C-v>': 'NvimEdit vsplit',
	            \ 'gw': 'JumpNvimCwd',
	            \ 'yw': 'EmitRangerCwd'
	            \ }
	let g:rnvimr_layout = { 'relative': 'editor',
	            \ 'width': &columns,
	            \ 'height': &lines,
	            \ 'col': 0,
	            \ 'row': 0,
	            \ 'style': 'minimal' }
	let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]
	nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>

Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }         " Find And Replace Vim plugin
	let g:far#mapping = {
			\ "replace_undo" : ["l"],
			\ }
	noremap <LEADER>f :F  **/*<left><left><left><left><left>

"""""""""""""""""""Editor Enhancement""""""""""""""""""
Plug 'sjl/clam.vim'                                            " A lightweight Vim plugin for working with shell commands.
Plug 'AmaiSaeta/capture.vim'                                   " Capture ex-command output to new buffer.
Plug 'ybian/smartim'                                           " A Vim plugin to make it stand well with input methods (Mac only)
	let g:smartim_default = 'com.apple.keylayout.Colemak'

Plug 'lilydjwg/fcitx.vim'	                                     " keep and restore fcitx state when leaving/re-entering insert mode
Plug 'lambdalisue/suda.vim'                                    " An alternative sudo.vim for Vim and Neovim, limited support sudo in Windows. do stuff like :sudowrite
	let g:suda_smart_edit = 1
	cnoreabbrev sudowrite w suda://%
	cnoreabbrev sw w suda://%

Plug 'mg979/vim-visual-multi'                                  " Multiple cursors plugin for vim/neovim
	"let g:VM_theme             = 'iceblue'
	"let g:VM_default_mappings = 0
	let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
	let g:VM_maps                       = {}
	let g:VM_custom_motions             = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
	let g:VM_maps['i']                  = 'k'
	let g:VM_maps['I']                  = 'K'
	let g:VM_maps['Find Under']         = '<C-k>'
	let g:VM_maps['Find Subword Under'] = '<C-k>'
	let g:VM_maps['Find Next']          = ''
	let g:VM_maps['Find Prev']          = ''
	let g:VM_maps['Remove Region']      = 'q'
	let g:VM_maps['Skip Region']        = '<c-n>'
	let g:VM_maps["Undo"]               = 'l'
	let g:VM_maps["Redo"]               = '<C-r>'

Plug 'jiangmiao/auto-pairs'                                    " Vim plugin, insert or delete brackets, parens, quotes in pair
	let g:AutoPairsFlyMode = 1
Plug 'tomtom/tcomment_vim'                                     " An extensible & universal comment vim-plugin that also handles embedded filetypes. in <space>cn to comment a line.
	let g:tcomment_textobject_inlinecomment = ''
	nnoremap ci cl
	nmap <LEADER>cn g>c
	vmap <LEADER>cn g>
	nmap <LEADER>cu g<c
	vmap <LEADER>cu g<

" Plug 'theniceboy/antovim'                                      " Super-simple vim plugin for cycling through antonyms/words related to word under cursor. gs to switch.
Plug 'tpope/vim-surround'                                      " surround.vim: quoting/parenthesizing made simple. type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`. In visual mode <CR>norm cs'` to block replace.
Plug 'gcmt/wildfire.vim'                                       " Smart selection of the closest text object. in Visual mode, type k' to select all text in '', or type k) k] k} kp
map <c-b> <Plug>(wildfire-quick-select)
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "it"],
    \ "html,xml" : ["at", "it"],
\ }

" TODO: error  <07-08-22, Kuring> "
Plug 'junegunn/vim-after-object'                               " Target text *after* the designated characters. da= to delete what's after =
	autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

Plug 'godlygeek/tabular'                                       " Vim script for text filtering and alignment. ga, or :Tabularize <regex> to align
	vmap ga :Tabularize /

Plug 'rhysd/clever-f.vim'                                      " Extended f, F, t and T key mappings for Vim.
Plug 'chrisbra/NrrwRgn'                                        " A Narrow Region Plugin for vim (like Emacs Narrow Region)
	let g:nrrw_rgn_nomap_nr = 1
	let g:nrrw_rgn_nomap_Nr = 1
	noremap <c-y> :NR<CR>

Plug 'sbdchd/neoformat'                                        " A (Neo)vim plugin for formatting code.
Plug 'vim-scripts/Tabmerge'                                    " Merge a tab's windows with the current tab
Plug 'mbbill/undotree'                                         " The undo history visualizer for VIM
	let g:undotree_DiffAutoOpen = 1
	let g:undotree_SetFocusWhenToggle = 1
	let g:undotree_ShortIndicators = 1
	let g:undotree_WindowLayout = 2
	let g:undotree_DiffpanelHeight = 8
	let g:undotree_SplitWidth = 24
	function g:Undotree_CustomMap()
		nmap <buffer> u <plug>UndotreeNextState
		nmap <buffer> e <plug>UndotreePreviousState
		nmap <buffer> U 5<plug>UndotreeNextState
		nmap <buffer> E 5<plug>UndotreePreviousState
	endfunc
	noremap L :UndotreeToggle<CR>

Plug 'junegunn/goyo.vim'                                       " Distraction-free writing in Vim
	map <LEADER>gy :Goyo<CR>
	autocmd! User GoyoEnter Limelight
	autocmd! User GoyoLeave Limelight!

Plug 'junegunn/limelight.vim'                                  " All the world's indeed a stage and we are merely players

""""""""""""""""""nvim-treesitter"""""""""""""""""""""""
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}    " Nvim Treesitter configurations and abstraction layer
Plug 'nvim-treesitter/playground'                              " Treesitter playground integrated into Neovim
Plug 'nvim-treesitter/nvim-treesitter-refactor'                " Refactor module for nvim-treesitter
Plug 'romgrk/nvim-treesitter-context'                          " Show code context

"""""""""""""""""""""""LSP-CoC""""""""""""""""""""""""""
Plug 'RRethy/vim-illuminate'                                   " automatically highlighting other uses of the current word under the cursor
Plug 'liuchengxu/vista.vim'                                    " Viewer & Finder for LSP symbols and tags
	noremap <LEADER>v :Vista!!<CR>
	noremap <c-t> :silent! Vista finder coc<CR>
	let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
	let g:vista_default_executive = 'coc'
	let g:vista_fzf_preview = ['right:50%']
	let g:vista#renderer#enable_icon = 1
	let g:vista#renderer#icons = {
	\   "function": "\uf794",
	\   "variable": "\uf71b",
	\  }
	" function! NearestMethodOrFunction() abort
	" 	return get(b:, 'vista_nearest_method_or_function', '')
	" endfunction
	" set statusline+=%{NearestMethodOrFunction()}
	" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

Plug 'neoclide/coc.nvim', {'branch': 'release'}                " Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers.
	let g:coc_global_extensions = [
		\ 'coc-vimtex',
		\ 'coc-actions',
		\ 'coc-css',
		\ 'coc-diagnostic',
		\ 'coc-explorer',
		\ 'coc-flutter-tools',
		\ 'coc-gitignore',
		\ 'coc-html',
		\ 'coc-json',
		\ 'coc-lists',
		\ 'coc-prettier',
		\ 'coc-pyright',
		\ 'coc-python',
		\ 'coc-snippets',
		\ 'coc-sourcekit',
		\ 'coc-stylelint',
		\ 'coc-syntax',
		\ 'coc-tasks',
		\ 'coc-todolist',
		\ 'coc-translator',
		\ 'coc-tslint-plugin',
		\ 'coc-tsserver',
		\ 'coc-vetur',
		\ 'coc-vimlsp',
		\ 'coc-yaml',
		\ 'coc-yank']

	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction
	inoremap <silent><expr> <TAB>
		\ coc#pum#visible() ? coc#pum#next(1):
		\ <SID>check_back_space() ? "\<Tab>" :
		\ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
	inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

	inoremap <silent><expr> <c-space> coc#refresh()
	inoremap <silent><expr> <c-o> coc#refresh()
	" use <C-n> navigating the completion list
	inoremap <expr> <C-n> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

	function! Show_documentation()
		call CocActionAsync('highlight')
		if (index(['vim','help'], &filetype) >= 0)
			execute 'h '.expand('<cword>')
		else
			call CocAction('doHover')
		endif
	endfunction
	nnoremap <LEADER>h :call Show_documentation()<CR>
	"nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
	nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
	nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
	"nnoremap <c-c> :CocCommand<CR>
	" Text Objects
	xmap kf <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap kf <Plug>(coc-funcobj-i)
	omap af <Plug>(coc-funcobj-a)
	xmap kc <Plug>(coc-classobj-i)
	omap kc <Plug>(coc-classobj-i)
	xmap ac <Plug>(coc-classobj-a)
	omap ac <Plug>(coc-classobj-a)
	" Useful commands
	nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	" nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)
	nmap <leader>rn <Plug>(coc-rename)
	nmap tt :CocCommand explorer<CR>
	" coc-translator
	nmap ts <Plug>(coc-translator-p)
	" Remap for do codeAction of selected region
	function! s:cocActionsOpenFromSelected(type) abort
		execute 'CocCommand actions.open ' . a:type
	endfunction
	xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
	nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
	" coctodolist
	nnoremap <leader>tn :CocCommand todolist.create<CR>
	nnoremap <leader>tl :CocList todolist<CR>
	nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
	" coc-tasks
	noremap <silent> <leader>ts :CocList tasks<CR>
	" coc-snippets
	imap <C-l> <Plug>(coc-snippets-expand)
	vmap <C-e> <Plug>(coc-snippets-select)
	let g:coc_snippet_next = '<c-e>'
	let g:coc_snippet_prev = '<c-u>'
	imap <C-e> <Plug>(coc-snippets-expand-jump)
	autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

Plug 'skywind3000/asynctasks.vim'                              " Modern Task System for Project Building, Testing and Deploying !!
Plug 'skywind3000/asyncrun.vim'                                " Run Async Shell Commands in Vim 8.0 / NeoVim and Output to the Quickfix Window !!
	noremap gp :AsyncRun git push<CR>

Plug 'wellle/tmux-complete.vim'                                " Vim plugin for insert mode completion of words in adjacent tmux panes
"Plug 'SirVer/ultisnips'
Plug 'theniceboy/vim-snippets'                                " vim-snipmate default snippets (Previously snipmate-snippets)

""""""""""""""""""""""Git"""""""""""""""""""""""""""""""
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }   " Gitignore plugin for Vim
"Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }       " Create useful .gitignore files for your project
Plug 'theniceboy/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }       " Create useful .gitignore files for your project
	noremap <LEADER>gi :FzfGitignore<CR>

Plug 'airblade/vim-gitgutter'                                  " A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
	" let g:gitgutter_signs = 0
	let g:gitgutter_sign_allow_clobber = 0
	let g:gitgutter_map_keys = 0
	let g:gitgutter_override_sign_column_highlight = 0
	let g:gitgutter_preview_win_floating = 1
	let g:gitgutter_sign_added = '▎'
	let g:gitgutter_sign_modified = '░'
	let g:gitgutter_sign_removed = '▏'
	let g:gitgutter_sign_removed_first_line = '▔'
	let g:gitgutter_sign_modified_removed = '▒'
	" autocmd BufWritePost * GitGutter
	nnoremap <LEADER>gf :GitGutterFold<CR>
	nnoremap H :GitGutterPreviewHunk<CR>
	nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
	nnoremap <LEADER>g= :GitGutterNextHunk<CR>

Plug 'cohama/agit.vim'                                         " A powerful Git log viewer
	nnoremap <LEADER>gl :Agit<CR>
	let g:agit_no_default_mappings = 1

""""""""""""""""""""""Language""""""""""""""""""""""""""""
Plug 'dkarter/bullets.vim'                                     "  Bullets.vim is a Vim/NeoVim plugin for automated bullet lists.
	" let g:bullets_set_mappings = 0
	let g:bullets_enabled_file_types = [
				\ 'markdown',
				\ 'text',
				\ 'gitcommit',
				\ 'scratch'
				\]

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }            " Go development plugin for Vim
	let g:go_echo_go_info = 0
	let g:go_doc_popup_window = 1
	let g:go_def_mapping_enabled = 0
	let g:go_template_autocreate = 0
	let g:go_textobj_enabled = 0
	let g:go_auto_type_info = 1
	let g:go_def_mapping_enabled = 0
	let g:go_highlight_array_whitespace_error = 1
	let g:go_highlight_build_constraints = 1
	let g:go_highlight_chan_whitespace_error = 1
	let g:go_highlight_extra_types = 1
	let g:go_highlight_fields = 1
	let g:go_highlight_format_strings = 1
	let g:go_highlight_function_calls = 1
	let g:go_highlight_function_parameters = 1
	let g:go_highlight_functions = 1
	let g:go_highlight_generate_tags = 1
	let g:go_highlight_methods = 1
	let g:go_highlight_operators = 1
	let g:go_highlight_space_tab_error = 1
	let g:go_highlight_string_spellcheck = 1
	let g:go_highlight_structs = 1
	let g:go_highlight_trailing_whitespace_error = 1
	let g:go_highlight_types = 1
	let g:go_highlight_variable_assignments = 0
	let g:go_highlight_variable_declarations = 0
	let g:go_doc_keywordprg_enabled = 0

Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}
	let g:vimspector_enable_mappings = 'HUMAN'
	function! s:read_template_into_buffer(template)
		" has to be a function to avoid the extra space fzf#run insers otherwise
		execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
	endfunction
	command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
				\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
				\   'down': 20,
				\   'sink': function('<sid>read_template_into_buffer')
				\ })
	" noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
	sign define vimspectorBP text=☛ texthl=Normal
	sign define vimspectorBPDisabled text=☞ texthl=Normal
	sign define vimspectorPC text=🔶 texthl=SpellBad

Plug 'elkowar/yuck.vim'

""""""""""""""""""""""Markdown""""""""""""""""""""""""""""
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
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

Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'} " live edit html, css, and javascript in vim

""""""""""""""""""""""Tex""""""""""""""""""""""""""""
Plug 'lervag/vimtex'                                           " VimTeX: A modern Vim and neovim filetype plugin for LaTeX files.
	let g:tex_flavor = 'latex'
	" use :copen to open error window
	let g:vimtex_quickfix_mode = 0
	let g:vimtex_view_general_viewer = 'zathura'
	let g:vimtex_view_method = 'zathura'
	let g:vimtex_compiler_progname = 'nvr'
	let g:vimtex_toc_config = {
	\ 'name' : 'TOC',
	\ 'layers' : ['content', 'todo', 'include'],
	\ 'split_width' : 25,
	\ 'todo_sorted' : 0,
	\ 'show_help' : 1,
	\ 'show_numbers' : 1,
	\}

call plug#end()

colorscheme deus

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust", "markdown", "html" },
  sync_install = false,
  auto_install = true,
  ignore_install = { "javascript" },
	
  highlight = {
    enable = true,
    disable = { "c", "rust" },
    additional_vim_regex_highlighting = true,
  },

	incremental_selection = {
		enable = true,
		keymap = {
			init_selection = '<CR>',
			node_incremental = '<CR>',
			node_decremental = '<BS>',
			scope_incremental = '<TAB>',
			}
	},

	refactor = {
		highlight_definitions = {
			enable = true,
			clear_on_cursor_move = true,
		}
	}
}
EOF
