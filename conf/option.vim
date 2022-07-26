" ===================== Editor Setup =====================


" ===
" === System
" ===
set clipboard+=unnamedplus                  " Copy paste between vim and everything else
let &t_ut=''                                " empty to tell Vim it needs to draw the background color
set autochdir                               " Your working directory will always be the same as your working directory


" ===
" === Editor behavior
" ===
set exrc
set secure
set number                                  " Line numbers
set relativenumber                          " Line relative numbers
set cursorline                              " Enable highlighting of the current line
set hidden                                  " Required to keep multiple buffers open multiple buffers
set noexpandtab                             " Don't use softtabstop spaces instead of tab characters for indentation
set tabstop=2                               " <TAB> in file represent 2 space
set shiftwidth=2                            " Indent by 2 spaces when using >>, <<, == etc.
set softtabstop=2                           " Indent by 2 when pressing <TAB>
set autoindent                              " Keep indentation from previous line
set list                                    " Show space,tabs,newlines,trailing space,wrapped lines
set listchars=tab:\|\ ,trail:▫              " Show char for tabs,trailing space
set scrolloff=4                             " Leave 4 lines down cursor"
set ttimeoutlen=0                           " No timeoutlen for preeing keys
set notimeout                               " No timeout
set viewoptions=cursor,folds,slash,unix
set wrap                                    " Text surround below line
set tw=0                                    " Maximum worth for inserting text
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright                              " Horizontal splits will automatically be below
set splitbelow                              " Vertical splits will automatically be to the right
set noshowmode                              " We don't need to see things like -- INSERT -- anymore
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c                            " Don't pass messages to |ins-completion-menu|.
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast                                 "should make scrolling faster
set lazyredraw                              "same as above
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
set colorcolumn=100
set updatetime=100                          " Faster completion
set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" set fileencoding
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" set spell check identify en_us and cjk
set spelllang=en_us,cjk
