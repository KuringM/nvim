" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')

""""""""""""""""""""""""""""""""""""""""

"""    _
"""   / \   _ __  _ __   ___  __ _ _ __ __ _ _ __   ___ ___
"""  / _ \ | '_ \| '_ \ / _ \/ _` | '__/ _` | '_ \ / __/ _ \
""" / ___ \| |_) | |_) |  __/ (_| | | | (_| | | | | (_|  __/
"""/_/   \_\ .__/| .__/ \___|\__,_|_|  \__,_|_| |_|\___\___|
"""        |_|   |_|

" Pretty Dress
Plug 'theniceboy/nvim-deus'                                    " vim theme

" Status line
Plug 'theniceboy/eleline.vim'                                  " elegant statusline for vim
Plug 'ojroques/vim-scrollstatus'                               " A scrollstatus for vim statuslin

" Other visual enhancement
Plug 'luochen1990/rainbow'                                     " Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration.
Plug 'mg979/vim-xtabline'                                      " Tabline customization with buffer filtering
Plug 'ryanoasis/vim-devicons'                                  " Adds file type icons to Vim plugins
Plug 'wincent/terminus'                                        " Enhanced terminal integration for Vim

" General Highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }      " asynchronously display the colours in file

" Vim Applications
Plug 'glepnir/dashboard-nvim'                                  " vim dashboard
Plug 'itchyny/calendar.vim'                                    " A calendar application for Vim


""" _   _           __       _   _____           _
"""| | | |___  ___ / _|_   _| | |_   _|__   ___ | |___
"""| | | / __|/ _ \ |_| | | | |   | |/ _ \ / _ \| / __|
"""| |_| \__ \  __/  _| |_| | |   | | (_) | (_) | \__ \
""" \___/|___/\___|_|  \__,_|_|   |_|\___/ \___/|_|___/


"Plug 'vimwiki/vimwiki'                                         " Personal Wiki for Vim

" chinese doc
Plug 'yianwillis/vimcdoc'                                      " vim chinese doc

" File navigation
Plug 'junegunn/fzf.vim'                                        " fuzzy finder
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }              " An efficient fuzzy finder that helps to locate files, buffers, mrus, gtags, etc. on the fly.
Plug 'kevinhwang91/rnvimr'                                     " use Ranger in a floating window
Plug 'airblade/vim-rooter'                                     " Rooter changes the working directory to the project root when you open a file or directory
Plug 'pechorin/any-jump.vim'                                   " Jump to any definition and references eye IDE madness without overhead rocket

Plug 'skywind3000/asynctasks.vim'                              " Modern Task System for Project Building, Testing and Deploying !!
Plug 'skywind3000/asyncrun.vim'                                " Run Async Shell Commands in Vim 8.0 / NeoVim and Output to the Quickfix Window !!

" Other useful utilities
Plug 'lambdalisue/suda.vim'                                    " An alternative sudo.vim for Vim and Neovim, limited support sudo in Windows. do stuff like :sudowrite

" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }         " Find And Replace Vim plugin

" Editor Enhancement
Plug 'jiangmiao/auto-pairs'                                    " Vim plugin, insert or delete brackets, parens, quotes in pair
Plug 'mg979/vim-visual-multi'                                  " Multiple cursors plugin for vim/neovim
Plug 'tomtom/tcomment_vim'                                     " An extensible & universal comment vim-plugin that also handles embedded filetypes. in <space>cn to comment a line. 
Plug 'theniceboy/antovim'                                      " Super-simple vim plugin for cycling through antonyms/words related to word under cursor. gs to switch.
Plug 'tpope/vim-surround'                                      " surround.vim: quoting/parenthesizing made simple. type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`.
Plug 'gcmt/wildfire.vim'                                       " Smart selection of the closest text object. in Visual mode, type k' to select all text in '', or type k) k] k} kp
Plug 'junegunn/vim-after-object'                               " Target text *after* the designated characters. da= to delete what's after =
Plug 'godlygeek/tabular'                                       " Vim script for text filtering and alignment. ga, or :Tabularize <regex> to align
Plug 'tpope/vim-capslock'                                      " Vim motions on speed! Ctrl+L (insert) to toggle capslock
Plug 'easymotion/vim-easymotion'                               " Vim motions on speed!
Plug 'svermeulen/vim-subversive'                               " Vim plugin providing operator motions to quickly replace text
Plug 'theniceboy/argtextobj.vim'                               " Text-object like motion for arguments (mod for colemak)
Plug 'rhysd/clever-f.vim'                                      " Extended f, F, t and T key mappings for Vim.
Plug 'chrisbra/NrrwRgn'                                        " A Narrow Region Plugin for vim (like Emacs Narrow Region)
Plug 'AndrewRadev/splitjoin.vim'                               " Switch between single-line and multiline forms of code


""" ____                                                _
"""|  _ \ _ __ ___   __ _ _ __ __ _ _ __ ___  _ __ ___ (_)_ __   __ _
"""| |_) | '__/ _ \ / _` | '__/ _` | '_ ` _ \| '_ ` _ \| | '_ \ / _` |
"""|  __/| | | (_) | (_| | | | (_| | | | | | | | | | | | | | | | (_| |
"""|_|   |_|  \___/ \__, |_|  \__,_|_| |_| |_|_| |_| |_|_|_| |_|\__, |
"""                 |___/                                       |___/


" highlight
Plug 'RRethy/vim-illuminate'                                   " automatically highlighting other uses of the current word under the cursor

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'commit':'0b67258', 'do':'TSUpdate'}  " Nvim Treesitter configurations and abstraction layer
Plug 'nvim-treesitter/playground'                              " Treesitter playground integrated into Neovim
Plug 'nvim-treesitter/nvim-treesitter-refactor'                " Refactor module for nvim-treesitter
Plug 'nvim-treesitter/playground'                              " Show code context
Plug 'romgrk/nvim-treesitter-context'


" Taglist
Plug 'liuchengxu/vista.vim'                                    " Viewer & Finder for LSP symbols and tags

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}                " Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers.
" Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': 'v0.0.79'}
Plug 'wellle/tmux-complete.vim'                                " Vim plugin for insert mode completion of words in adjacent tmux panes

" Snippets
Plug 'theniceboy/vim-snippets'                                 " vim-snipmate default snippets (Previously snipmate-snippets)

" Undo Tree
Plug 'mbbill/undotree'                                         " The undo history visualizer for VIM

" Git
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }   " Gitignore plugin for Vim
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }       " Create useful .gitignore files for your project
"Plug 'mhinz/vim-signify'                                      " Show a diff using Vim its sign column.
Plug 'airblade/vim-gitgutter'                                  " A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
Plug 'cohama/agit.vim'                                         " A powerful Git log viewer

" Autoformat
Plug 'google/vim-maktaba'                                      " Consistent Vimscript
Plug 'google/vim-codefmt'                                      " codefmt is a utility for syntax-aware code formatting.
Plug 'sbdchd/neoformat'                                        " A (Neo)vim plugin for formatting code.
" Tex
" Plug 'lervag/vimtex'                                         " VimTeX: A modern Vim and neovim filetype plugin for LaTeX files.

" CSharp
Plug 'OmniSharp/omnisharp-vim'                                 " Vim omnicompletion (intellisense) and more for C#
Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] }      " omnisharp-vim dependency, Active fork of kien/ctrlp.vim—Fuzzy file, buffer, mru, tag, etc finder.

" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
Plug 'elzr/vim-json'                                           " A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.
Plug 'neoclide/jsonc.vim'                                      " jsonc syntax support for vim
Plug 'othree/html5.vim'                                        " HTML5 omnicomplete and syntax
Plug 'alvan/vim-closetag'                                      " Auto close (X)HTML tags
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }  " The most accurate syntax highlighting plugin for JavaScript and Flow.js

" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }          " Go development plugin for Vim

" Python
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }  " A nicer Python indentation style for vim.
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }   " Semantic Highlighting for Python in Neovim
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }     " Text objects, folding, and more for Python and other indented languages.

" Flutter
Plug 'dart-lang/dart-vim-plugin'                               " Syntax highlighting for Dart in Vim
Plug 'f-person/pubspec-assist-nvim', { 'for' : ['pubspec.yaml'] }        " Easily add dependencies to your Dart / Flutter project without leaving Neovim

" Swift
Plug 'keith/swift.vim'                                         " Vim runtime files for Swift
Plug 'arzg/vim-swift'                                          " A Swift syntax plugin for Vim that aims to match Xcode’s level of detail (WIP)

" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}          " Instant Markdown previews from VIm!
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }  " VIM Table Mode for instant table creation.
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }                        " A vim 7.4+ plugin to generate table of contents for Markdown files.
Plug 'dkarter/bullets.vim'                                     "  Bullets.vim is a Vim/NeoVim plugin for automated bullet lists.


call plug#end()
set re=0

" experimental
set lazyredraw
"set regexpengine=1

