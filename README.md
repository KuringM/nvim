## <center> My [Colemak](https://colemak.com/) nvim</center>
<!-- /TOC -->
## Dependeces
- Install `pip`, and do `pip install --user pynvim`
- Install `pip3`, and do `pip3 install --user pynvim`
- Install `node`, and do `npm install -g neovim`
- Install nerd-fonts (actually it's optional but it looks real good)

## Some Installation

### For Python Debugger (via `vimspector`)
- Install `debugpy` (`pip`)

### Config `Python` path
- Well, make sure you have python
- See `_machine_specific.vim`

### For Taglist:
- Install `ctags` for function/class/variable list

### For FZF
- Install `fzf`
- Install `ag` (`the_silver_searcher`)

### And also...
- Install `figlet` for inputing text ASCII art
- Install `xclip` for system clipboard access (`Linux` and `xorg` only)

### Plugs List
#### Appearance
- [x] [vim-deus](https://github.com/theniceboy/vim-deus) -- A better color scheme for the late night coder

- [x] [vim-bolt](https://github.com/bpietravalle/vim-bolt) -- vim syntax highlighting for firebase-bolt

- [x] [eleline.vim](https://github.com/theniceboy/eleline.vim) -- Another elegant statusline for vim

- [x] [vim-scrollstatus](https://github.com/ojroques/vim-scrollstatus) --  A Vim plugin to display a scrollbar in the statusline

- [x] [vim-hexokinase](https://github.com/RRethy/vim-hexokinase) -- asynchronously display the colours in file

- [x] [vim-illuminate](https://github.com/RRethy/vim-illuminate) --  automatically highlighting other uses of the current word under the cursor.Integrates with Neovim's LSP client for intelligent highlighting.

- [x] [rainbow](https://github.com/luochen1990/rainbow) -- 
Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration.

- [x] [vim-xtabline](https://github.com/mg979/vim-xtabline) -- Tabline customization with buffer filtering

- [x] [vim-devicons](https://github.com/ryanoasis/vim-devicons) -- Adds file type icons to Vim plugins

- [x] [terminus](https://github.com/wincent/terminus) -- Enhanced terminal integration for Vim

#### Useful Tools

- [x] [vimcdoc](https://github.com/yianwillis/vimcdoc) -- vim chinese doc

- [x] [fzf.vim](https://github.com/junegunn/fzf.vim) -- fzf vim

- [x] [LeaderF](https://github.com/Yggdroot/LeaderF) -- An efficient fuzzy finder that helps to locate files, buffers, mrus, gtags, etc. on the fly for both vim and neovim

- [x] [rnvimr](https://github.com/kevinhwang91/rnvimr) -- Make Ranger running in a floating window to communicate with Neovim via RPC

- [x] [vim-rooter](https://github.com/airblade/vim-rooter) -- Changes Vim working directory to project root.

- [x] [any-jump](https://github.com/pechorin/any-jump) -- Jump to any definition and references eye IDE madness without overhead rocket

- [x] [vim-startify](https://github.com/mhinz/vim-startify) -- The fancy start screen for vim.

- [x] [asynctasks.vim](https://github.com/skywind3000/asynctasks.vim) -- Modern Task System for Project Building, Testing and Deploying !!

- [x] [asyncrun.vim](https://github.com/skywind3000/asyncrun.vim) -- Run Async Shell Commands in Vim 8.0 / NeoVim and Output to the Quickfix Window !!

- [x] [calendar.vim](https://github.com/itchyny/calendar.vim) -- A calendar application for Vim

- [x] [suda.vim](https://github.com/lambdalisue/suda.vim) -- An alternative sudo.vim for Vim and Neovim, limited support sudo in Windows

- [x] [far.vim](https://github.com/brooth/far.vim) -- Find And Replace Vim plugin

- [x] [auto-pairs](https://github.com/jiangmiao/auto-pairs) -- Vim plugin, insert or delete brackets, parens, quotes in pair

- [x] [vim-visual-multi](https://github.com/mg979/vim-visual-multi) -- Multiple cursors plugin for vim/neovim

- [x] [tcomment_vim](https://github.com/tomtom/tcomment_vim) -- An extensible & universal comment vim-plugin that also handles embedded filetypes

- [x] [antovim](https://github.com/theniceboy/antovim) -- Super-simple vim plugin for cycling through antonyms/words related to word under cursor

- [x] [vim-surround](https://github.com/tpope/vim-surround) -- surround.vim: quoting/parenthesizing made simple

- [x] [wildfire.vim](https://github.com/gcmt/wildfire.vim) -- Smart selection of the closest text object

- [x] [vim-after-object](https://github.com/junegunn/vim-after-object) -- Target text *after* the designated characters

- [x] [tabular](https://github.com/godlygeek/tabular) -- Vim script for text filtering and alignment

- [x] [vim-capslock](https://github.com/tpope/vim-capslock) -- Software caps lock

- [x] [vim-easymotion](https://github.com/easymotion/vim-easymotion) -- Vim motions on speed!

- [x] [vim-subversive](https://github.com/svermeulen/vim-subversive) -- Vim plugin providing operator motions to quickly replace text

- [x] [argtextobj](https://github.com/theniceboy/argtextobj.vim) -- Text-object like motion for arguments (mod for colemak)

- [x] [clever-f.vim](https://github.com/rhysd/clever-f.vim) -- Extended f, F, t and T key mappings for Vim.

- [x] [NrrwRgn](https://github.com/chrisbra/NrrwRgn) -- A Narrow Region Plugin for vim (like Emacs Narrow Region)

- [x] [splitjoin](https://github.com/AndrewRadev/splitjoin.vim) -- Switch between single-line and multiline forms of code


#### Programming

- [x] [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) -- Nvim Treesitter configurations and abstraction layer

- [x] [playground](https://github.com/nvim-treesitter/playground) -- Treesitter playground integrated into Neovim

- [x] [nvim-treesitter-refactor](https://github.com/nvim-treesitter/nvim-treesitter-refactor) -- Refactor module for nvim-treesitter

- [x] [nvim-treesitter-context](https://github.com/romgrk/nvim-treesitter-context) -- Show code context

- [x] [vista.vim](https://github.com/liuchengxu/vista.vim) -- Viewer & Finder for LSP symbols and tags

- [x] [coc.nvim](https://github.com/neoclide/coc.nvim) -- Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers.

- [x] [tmux-complete.vim](https://github.com/wellle/tmux-complete.vim) -- Vim plugin for insert mode completion of words in adjacent tmux panes

- [x] [vim-snippets](https://github.com/theniceboy/vim-snippets) -- vim-snipmate default snippets (Previously snipmate-snippets)

- [x] [undotree](https://github.com/mbbill/undotree) -- The undo history visualizer for VIM

- [x] [vim-gitignore](https://github.com/theniceboy/vim-gitignore) -- Gitignore plugin for Vim

- [x] [fzf-gitignore](https://github.com/fszymanski/fzf-gitignore) -- Create useful .gitignore files for your project

- [x] [vim-gitgutter](https://github.com/airblade/vim-gitgutter) -- A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.

- [x] [agit.vim](https://github.com/cohama/agit.vim) -- A powerful Git log viewer

- [x] [vim-maktaba](https://github.com/google/vim-maktaba) -- Consistent Vimscript

- [x] [vim-codefmt](https://github.com/google/vim-codefmt) -- codefmt is a utility for syntax-aware code formatting. 

- [x] [neoformat](https://github.com/sbdchd/neoformat) -- A (Neo)vim plugin for formatting code.

- [x] [omnisharp-vim](https://github.com/OmniSharp/omnisharp-vim) -- Vim omnicompletion (intellisense) and more for C#

- [x] [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) -- Active fork of kien/ctrlp.vim—Fuzzy file, buffer, mru, tag, etc finder.

- [x] [vim-json](https://github.com/elzr/vim-json) -- A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.

- [x] [jsonc.vim](https://github.com/neoclide/jsonc.vim) -- jsonc syntax support for vim

- [x] [html5.vim](https://github.com/othree/html5.vim) -- HTML5 omnicomplete and syntax

- [x] [vim-closetag](https://github.com/alvan/vim-closetag) -- Auto close (X)HTML tags

- [x] [vim-js](https://github.com/yuezk/vim-js) -- The most accurate syntax highlighting plugin for JavaScript and Flow.js

- [x] [vim-go](https://github.com/fatih/vim-go) -- Go development plugin for Vim

- [x] [vim-python-pep8-indent](https://github.com/Vimjas/vim-python-pep8-indent) -- A nicer Python indentation style for vim.

- [x] [semshi](https://github.com/numirias/semshi) -- Semantic Highlighting for Python in Neovim

- [x] [braceless.vim](https://github.com/tweekmonster/braceless.vim) -- Text objects, folding, and more for Python and other indented languages.

- [x] [dart-vim-plugin](https://github.com/dart-lang/dart-vim-plugin) -- Syntax highlighting for Dart in Vim

- [x] [pubspec-assist-nvim](https://github.com/f-person/pubspec-assist-nvim) -- Easily add dependencies to your Dart / Flutter project without leaving Neovim

- [x] [swift.vim](https://github.com/keith/swift.vim) -- Vim runtime files for Swift

- [x] [vim-swift](https://github.com/arzg/vim-swift) -- A Swift syntax plugin for Vim that aims to match Xcode’s level of detail (WIP)

- [x] [vim-instant-markdown](https://github.com/suan/vim-instant-markdown) -- Instant Markdown previews from VIm!

- [x] [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode) -- VIM Table Mode for instant table creation.

- [x] [vim-markdown-toc](https://github.com/mzlogin/vim-markdown-toc) -- A vim 7.4+ plugin to generate table of contents for Markdown files.

- [x] [bullets.vim](https://github.com/dkarter/bullets.vim) --  Bullets.vim is a Vim/NeoVim plugin for automated bullet lists.



[^_^]: [<++>](https://github.com/<++>/<++>)
