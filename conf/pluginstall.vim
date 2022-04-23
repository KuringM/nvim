" ===================== Install Plugins with Vim-Plug =====================

call plug#begin('~/.config/nvim/plugged')

"""""""""""""""""""""Pretty Dress""""""""""""""""""""""
Plug 'theniceboy/nvim-deus'                                    " vim theme
Plug 'theniceboy/eleline.vim'                                  " elegant statusline for vim
Plug 'ojroques/vim-scrollstatus'                               " A scrollstatus for vim statuslin
Plug 'luochen1990/rainbow'                                     " Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration.
Plug 'mg979/vim-xtabline'                                      " Tabline customization with buffer filtering
Plug 'ryanoasis/vim-devicons'                                  " Adds file type icons to Vim plugins
Plug 'wincent/terminus'                                        " Enhanced terminal integration for Vim
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }      " asynchronously display the colours in file
Plug 'glepnir/dashboard-nvim'                                  " vim dashboard

"""""""""""""""""""""Search"""""""""""""""""""
Plug 'yianwillis/vimcdoc'                                      " vim chinese doc
Plug 'junegunn/fzf.vim'                                        " fuzzy finder
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }              " An efficient fuzzy finder that helps to locate files, buffers, mrus, gtags, etc. on the fly.
Plug 'kevinhwang91/rnvimr'                                     " use Ranger in a floating window
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }         " Find And Replace Vim plugin

"""""""""""""""""""Editor Enhancement""""""""""""""""""
Plug 'lilydjwg/fcitx.vim'											                 " keep and restore fcitx state when leaving/re-entering insert mode
Plug 'lambdalisue/suda.vim'                                    " An alternative sudo.vim for Vim and Neovim, limited support sudo in Windows. do stuff like :sudowrite
Plug 'mg979/vim-visual-multi'                                  " Multiple cursors plugin for vim/neovim
Plug 'jiangmiao/auto-pairs'                                    " Vim plugin, insert or delete brackets, parens, quotes in pair
Plug 'tomtom/tcomment_vim'                                     " An extensible & universal comment vim-plugin that also handles embedded filetypes. in <space>cn to comment a line.
"Plug 'theniceboy/antovim'                                      " Super-simple vim plugin for cycling through antonyms/words related to word under cursor. gs to switch.
Plug 'tpope/vim-surround'                                      " surround.vim: quoting/parenthesizing made simple. type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`.
Plug 'gcmt/wildfire.vim'                                       " Smart selection of the closest text object. in Visual mode, type k' to select all text in '', or type k) k] k} kp
Plug 'junegunn/vim-after-object'                               " Target text *after* the designated characters. da= to delete what's after =
Plug 'godlygeek/tabular'                                       " Vim script for text filtering and alignment. ga, or :Tabularize <regex> to align
Plug 'rhysd/clever-f.vim'                                      " Extended f, F, t and T key mappings for Vim.
Plug 'chrisbra/NrrwRgn'                                        " A Narrow Region Plugin for vim (like Emacs Narrow Region)
Plug 'sbdchd/neoformat'                                        " A (Neo)vim plugin for formatting code.

""""""""""""""""""nvim-treesitter"""""""""""""""""""""""
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}    " Nvim Treesitter configurations and abstraction layer
Plug 'nvim-treesitter/playground'                              " Treesitter playground integrated into Neovim
Plug 'nvim-treesitter/nvim-treesitter-refactor'                " Refactor module for nvim-treesitter
Plug 'romgrk/nvim-treesitter-context'                          " Show code context

"""""""""""""""""""""""LSP-CoC""""""""""""""""""""""""""
Plug 'RRethy/vim-illuminate'                                   " automatically highlighting other uses of the current word under the cursor
Plug 'liuchengxu/vista.vim'                                    " Viewer & Finder for LSP symbols and tags
Plug 'neoclide/coc.nvim', {'branch': 'release'}                " Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers.
Plug 'skywind3000/asynctasks.vim'                              " Modern Task System for Project Building, Testing and Deploying !!
Plug 'skywind3000/asyncrun.vim'                                " Run Async Shell Commands in Vim 8.0 / NeoVim and Output to the Quickfix Window !!
Plug 'wellle/tmux-complete.vim'                                " Vim plugin for insert mode completion of words in adjacent tmux panes
Plug 'SirVer/ultisnips'
Plug 'theniceboy/vim-snippets'                                " vim-snipmate default snippets (Previously snipmate-snippets)

""""""""""""""""""""""Git"""""""""""""""""""""""""""""""
Plug 'mbbill/undotree'                                         " The undo history visualizer for VIM
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }   " Gitignore plugin for Vim
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }       " Create useful .gitignore files for your project
Plug 'airblade/vim-gitgutter'                                  " A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
Plug 'cohama/agit.vim'                                         " A powerful Git log viewer

""""""""""""""""""""""Language""""""""""""""""""""""""""""
Plug 'dkarter/bullets.vim'                                     "  Bullets.vim is a Vim/NeoVim plugin for automated bullet lists.
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }            " Go development plugin for Vim
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}
Plug 'elkowar/yuck.vim'

""""""""""""""""""""""Markdown""""""""""""""""""""""""""""
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }  " VIM Table Mode for instant table creation.
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }                        " A vim 7.4+ plugin to generate table of contents for Markdown files.
Plug 'junegunn/goyo.vim'                                       " Distraction-free writing in Vim
Plug 'junegunn/limelight.vim'                                  " All the world's indeed a stage and we are merely players

""""""""""""""""""""""Tex""""""""""""""""""""""""""""
Plug 'lervag/vimtex'                                           " VimTeX: A modern Vim and neovim filetype plugin for LaTeX files.

call plug#end()
