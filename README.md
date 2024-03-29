## <center> My [Colemak](https://colemak.com/) nvim</center>
<!-- /TOC -->
## Dependeces
- Install `pip`, and do `pip install --user pynvim`
- Install `pip3`, and do `pip3 install --user pynvim`
- Install `node`, and do `npm install -g neovim`
- Install nerd-fonts (actually it's optional but it looks real good)

### LSP need
- Install	`ccls`(a C/C++/Objective-C language server.) macos `brew install ccls`

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
- Install `rg`

### And also...
- Install `figlet` for inputing text ASCII art
- Install `xclip` for system clipboard access (`Linux` and `xorg` only)

## Plugs List
#### Appearance
---
- [x] [vim-deus](https://github.com/theniceboy/vim-deus) -- A better color scheme for the late night coder

- [ ] [vim-bolt](https://github.com/bpietravalle/vim-bolt) -- vim syntax highlighting for firebase-bolt

- [x] [eleline.vim](https://github.com/theniceboy/eleline.vim) -- Another elegant statusline for vim

- [x] [vim-scrollstatus](https://github.com/ojroques/vim-scrollstatus) --  A Vim plugin to display a scrollbar in the statusline

- [x] [rainbow](https://github.com/luochen1990/rainbow) -- Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration.

- [x] [vim-xtabline](https://github.com/mg979/vim-xtabline) -- Tabline customization with buffer filtering

- [x] [vim-devicons](https://github.com/ryanoasis/vim-devicons) -- Adds file type icons to Vim plugins

- [x] [terminus](https://github.com/wincent/terminus) -- Enhanced terminal integration for Vim

- [x] [vim-hexokinase](https://github.com/RRethy/vim-hexokinase) -- asynchronously display the colours in file

- [x] [dashboard-nvim](https://github.com/glepnir/dashboard-nvim) -- vim dashboard

#### Search
- [x] [vimcdoc](https://github.com/yianwillis/vimcdoc) -- vim chinese doc

- [x] [fzf.vim](https://github.com/junegunn/fzf.vim) -- fzf vim

- [x] [LeaderF](https://github.com/Yggdroot/LeaderF) -- An efficient fuzzy finder that helps to locate files, buffers, mrus, gtags, etc. on the fly for both vim and neovim

- [x] [rnvimr](https://github.com/kevinhwang91/rnvimr) -- Make Ranger running in a floating window to communicate with Neovim via RPC

- [x] [far.vim](https://github.com/brooth/far.vim) -- Find And Replace Vim plugin

- [ ] [vim-rooter](https://github.com/airblade/vim-rooter) -- Changes Vim working directory to project root.

- [ ] [any-jump.vim](https://github.com/pechorin/any-jump.vim) -- Jump to any definition and references eye IDE madness without overhead rocket

- [ ] [vim-startify](https://github.com/mhinz/vim-startify) -- The fancy start screen for vim.

- [ ] [calendar.vim](https://github.com/itchyny/calendar.vim) -- A calendar application for Vim

#### Editor Enhancement
- [x] [smartim](https://github.com/ybian/smartim) -- A Vim plugin to make it stand well with input methods (Mac only)

- [x] [fcitx.vim](https://github.com/lilydjwg/fcitx.vim) -- keep and restore fcitx state when leaving/re-entering insert mode

- [x] [suda.vim](https://github.com/lambdalisue/suda.vim) -- An alternative sudo.vim for Vim and Neovim, limited support sudo in Windows

- [x] [vim-visual-multi](https://github.com/mg979/vim-visual-multi) -- Multiple cursors plugin for vim/neovim

- [x] [auto-pairs](https://github.com/jiangmiao/auto-pairs) -- Vim plugin, insert or delete brackets, parens, quotes in pair

- [x] [tcomment_vim](https://github.com/tomtom/tcomment_vim) -- An extensible & universal comment vim-plugin that also handles embedded filetypes

- [ ] [antovim](https://github.com/theniceboy/antovim) -- Super-simple vim plugin for cycling through antonyms/words related to word under cursor

- [x] [vim-surround](https://github.com/tpope/vim-surround) -- surround.vim: quoting/parenthesizing made simple

- [x] [wildfire.vim](https://github.com/gcmt/wildfire.vim) -- Smart selection of the closest text object

- [x] [vim-after-object](https://github.com/junegunn/vim-after-object) -- Target text *after* the designated characters

- [x] [tabular](https://github.com/godlygeek/tabular) -- Vim script for text filtering and alignment

- [x] [clever-f.vim](https://github.com/rhysd/clever-f.vim) -- Extended f, F, t and T key mappings for Vim.

- [ ] [vim-capslock](https://github.com/tpope/vim-capslock) -- Software caps lock

- [ ] [vim-easymotion](https://github.com/easymotion/vim-easymotion) -- Vim motions on speed!

- [ ] [vim-subversive](https://github.com/svermeulen/vim-subversive) -- Vim plugin providing operator motions to quickly replace text

- [ ] [argtextobj](https://github.com/theniceboy/argtextobj.vim) -- Text-object like motion for arguments (mod for colemak)

- [x] [NrrwRgn](https://github.com/chrisbra/NrrwRgn) -- A Narrow Region Plugin for vim (like Emacs Narrow Region)

- [ ] [splitjoin](https://github.com/AndrewRadev/splitjoin.vim) -- Switch between single-line and multiline forms of code

- [x] [neoformat](https://github.com/sbdchd/neoformat) -- A (Neo)vim plugin for formatting code.

- [x] [Tabmerge](https://github.com/vim-scripts/Tabmerge) -- Merge a tab's windows with the current tab

- [x] [undotree](https://github.com/mbbill/undotree) -- The undo history visualizer for VIM

#### nvim-treesitter
- [x] [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) -- Nvim Treesitter configurations and abstraction layer

- [x] [playground](https://github.com/nvim-treesitter/playground) -- Treesitter playground integrated into Neovim

- [x] [nvim-treesitter-refactor](https://github.com/nvim-treesitter/nvim-treesitter-refactor) -- Refactor module for nvim-treesitter

- [x] [nvim-treesitter-context](https://github.com/romgrk/nvim-treesitter-context) -- Show code context

#### LSP-CoC
- [x] [vim-illuminate](https://github.com/RRethy/vim-illuminate) --  automatically highlighting other uses of the current word under the cursor.Integrates with Neovim's LSP client for intelligent highlighting.

- [x] [vista.vim](https://github.com/liuchengxu/vista.vim) -- Viewer & Finder for LSP symbols and tags

- [x] [coc.nvim](https://github.com/neoclide/coc.nvim) -- Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers.

- [x] [asynctasks.vim](https://github.com/skywind3000/asynctasks.vim) -- Modern Task System for Project Building, Testing and Deploying !!

- [x] [asyncrun.vim](https://github.com/skywind3000/asyncrun.vim) -- Run Async Shell Commands in Vim 8.0 / NeoVim and Output to the Quickfix Window !!

- [x] [tmux-complete.vim](https://github.com/wellle/tmux-complete.vim) -- Vim plugin for insert mode completion of words in adjacent tmux panes

- [x] [vim-snippets](https://github.com/theniceboy/vim-snippets) -- vim-snipmate default snippets (Previously snipmate-snippets)

#### Git
- [x] [vim-gitignore](https://github.com/theniceboy/vim-gitignore) -- Gitignore plugin for Vim

- [x] [fzf-gitignore](https://github.com/fszymanski/fzf-gitignore) -- Create useful .gitignore files for your project

- [x] [vim-gitgutter](https://github.com/airblade/vim-gitgutter) -- A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.

- [x] [agit.vim](https://github.com/cohama/agit.vim) -- A powerful Git log viewer

- [ ] [vim-maktaba](https://github.com/google/vim-maktaba) -- Consistent Vimscript

#### Language
- [ ] [vim-codefmt](https://github.com/google/vim-codefmt) -- codefmt is a utility for syntax-aware code formatting. 

- [x] [bullets.vim](https://github.com/dkarter/bullets.vim) --  Bullets.vim is a Vim/NeoVim plugin for automated bullet lists.

- [x] [vim-go](https://github.com/fatih/vim-go) -- Go development plugin for Vim

- [x] [vimspector](https://github.com/puremourning/vimspector) -- vimspector - A multi-language debugging system for Vim

- [x] [yuck.vim](https://github.com/elkowar/yuck.vim)

#### Markdown 
- [x] [markdown-preview.vim](https://github.com/iamcco/markdown-preview.nvim)

- [ ] [vim-instant-markdown](https://github.com/suan/vim-instant-markdown) -- Instant Markdown previews from VIm!

- [x] [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode) -- VIM Table Mode for instant table creation.

- [x] [vim-markdown-toc](https://github.com/mzlogin/vim-markdown-toc) -- A vim 7.4+ plugin to generate table of contents for Markdown files.

- [x] [goyo.vim](https://github.com/junegunn/goyo.vim) -- Distraction-free writing in Vim

- [x] [limelight.vim](https://github.com/junegunn/limelight.vim) -- All the world's indeed a stage and we are merely players

#### Tex
- [x] [vimtex](https://github.com/lervag/vimtex) -- VimTeX: A modern Vim and neovim filetype plugin for LaTeX files.

#### other
- [ ] [omnisharp-vim](https://github.com/OmniSharp/omnisharp-vim) -- Vim omnicompletion (intellisense) and more for C#

- [ ] [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) -- Active fork of kien/ctrlp.vim—Fuzzy file, buffer, mru, tag, etc finder.

- [ ] [vim-json](https://github.com/elzr/vim-json) -- A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.

- [ ] [jsonc.vim](https://github.com/neoclide/jsonc.vim) -- jsonc syntax support for vim

- [ ] [html5.vim](https://github.com/othree/html5.vim) -- HTML5 omnicomplete and syntax

- [ ] [vim-closetag](https://github.com/alvan/vim-closetag) -- Auto close (X)HTML tags

- [ ] [vim-js](https://github.com/yuezk/vim-js) -- The most accurate syntax highlighting plugin for JavaScript and Flow.js

- [ ] [vim-python-pep8-indent](https://github.com/Vimjas/vim-python-pep8-indent) -- A nicer Python indentation style for vim.

- [ ] [semshi](https://github.com/numirias/semshi) -- Semantic Highlighting for Python in Neovim

- [ ] [braceless.vim](https://github.com/tweekmonster/braceless.vim) -- Text objects, folding, and more for Python and other indented languages.

- [ ] [dart-vim-plugin](https://github.com/dart-lang/dart-vim-plugin) -- Syntax highlighting for Dart in Vim

- [ ] [pubspec-assist-nvim](https://github.com/f-person/pubspec-assist-nvim) -- Easily add dependencies to your Dart / Flutter project without leaving Neovim

- [ ] [swift.vim](https://github.com/keith/swift.vim) -- Vim runtime files for Swift

- [ ] [vim-swift](https://github.com/arzg/vim-swift) -- A Swift syntax plugin for Vim that aims to match Xcode’s level of detail (WIP)

- [ ] [nerdtree](https://github.com/scrooloose/nerdtree) -- A tree explorer plugin for vim.

- [ ] [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin) -- A plugin of NERDTree showing git status

- [ ] [vim-orgmode](https://github.com/jceb/vim-orgmode) -- Text outlining and task management for Vim based on Emacs' Org-Mode
 
- [ ] [vim-pdf](https://github.com/makerj/vim-pdf) -- Make VIM as a PDF reader
 
- [ ] [vim-session](https://github.com/xolox/vim-session) -- Extended session management for Vim (:mksession on steroids)

- [ ] [vim-misc](https://github.com/xolox/vim-misc) -- Miscellaneous auto-load Vim scripts

- [ ] [vim-addon-mw-utils](https://github.com/MarcWeber/vim-addon-mw-utils) -- interpret a file by function and cache file automatically

- [ ] [vim-textobj-user](https://github.com/kana/vim-textobj-user) -- Create your own text objects
 
- [ ] [nvim-yarp](https://github.com/roxma/nvim-yarp) -- Yet Another Remote Plugin Framework for Neovim

- [ ] [vim-wordy](https://github.com/reedes/vim-wordy) -- Uncover usage problems in your writing

- [ ] [thesaurus_query.vim](https://github.com/ron89/thesaurus_query.vim) -- Multi-language Thesaurus Query and Replacement plugin for Vim/NeoVim

- [ ] [vim-bookmarks](https://github.com/MattesGroeger/vim-bookmarks) -- Vim bookmark plugin

- [ ] [zeavim.vim](https://github.com/KabbAmine/zeavim.vim) -- Zeal for Vim

- [ ] [delimitMate](https://github.com/Raimondi/delimitMate) -- Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.

- [ ] [FastFold](https://github.com/Konfekt/FastFold) -- Speed up Vim by updating folds only when called-for.

- [ ] [vim-peekaboo](https://github.com/junegunn/vim-peekaboo) -- " / @ / CTRL-R

- [ ] [context.vim](https://github.com/wellle/context.vim) -- Vim plugin that shows the context of the currently visible buffer contents

- [ ] [vim-calc](https://github.com/theniceboy/vim-calc) -- A vim plugin that calculates math equations in the current buffer

- [ ] [ultisnips](https://github.com/SirVer/ultisnips) -- UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!

- [ ] [vim-signify](https://github.com/mhinz/vim-signify) -- Show a diff using Vim its sign column.

- [ ] [vim-css3-syntax](https://github.com/hail2u/vim-css3-syntax) -- CSS3 syntax (and syntax defined in some foreign specifications) support for Vim's built-in syntax/css.vim

- [ ] [PIV](https://github.com/spf13/PIV) -- PHP Integration environment for Vim

- [ ] [vim-javascript](https://github.com/pangloss/vim-javascript) -- Vastly improved Javascript indentation and syntax support in Vim.

- [ ] [vim-jsx-pretty](https://github.com/MaxMEllon/vim-jsx-pretty) -- JSX and TSX syntax pretty highlighting for vim.

- [ ] [vim-javascript-syntax](https://github.com/jelera/vim-javascript-syntax) -- Enhanced javascript syntax file for Vim

- [ ] [browserlink.vim](https://github.com/jaxbot/browserlink.vim) -- Live browser editing for Vim

- [ ] [yats.vim](https://github.com/HerringtonDarkholme/yats.vim) -- Yet Another TypeScript Syntax: The most advanced TypeScript Syntax Highlighting in Vim

- [ ] [vim-vue](https://github.com/posva/vim-vue) -- Syntax Highlight for Vue.js components

- [ ] [vim-svelte](https://github.com/evanleck/vim-svelte) -- Vim syntax highlighting and indentation for Svelte 3 components.

- [ ] [vim-svelte-plugin](https://github.com/leafOfTree/vim-svelte-plugin) -- Vim syntax and indent plugin for .svelte files

- [ ] [typescript-vim](https://github.com/leafgarland/typescript-vim) -- Typescript syntax files for Vim

- [ ] [SimpylFold](https://github.com/tmhedberg/SimpylFold) -- No-BS Python code folding for Vim

- [ ] [indentpython.vim](https://github.com/vim-scripts/indentpython.vim) -- An alternative indentation script for python

- [ ] [vim-virtualenv](https://github.com/plytophogy/vim-virtualenv) -- Vim plugin for working with python virtualenvs

- [ ] [vim-orgmode](https://github.com/jceb/vim-orgmode) -- Text outlining and task management for Vim based on Emacs' Org-Mode

[^_^]: - [ ] [<++>](https://github.com/<++>/<++>)

