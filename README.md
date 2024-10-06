## My Nvim `Lua.conf`

${toc}

## Plugins

### Rice

- [theniceboy/nvim-deus](https://github.com/theniceboy/nvim-deus)
- [fenetikm/falcon](https://github.com/fenetikm/falcon)
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) -- A snazzy bufferline for Neovim
- [gelguy/wilder.nvim](https://github.com/gelguy/wilder.nvim) -- A more adventurous wildmenu
- [shellRaining/hlchunk.nvim](https://github.com/shellRaining/hlchunk.nvim) -- This is the lua implementation of nvim-hlchunk, you can use this neovim plugin to highlight your indent line and the current chunk (context) your cursor stayed
- [nvim-zh/colorful-winsep.nvim](https://github.com/nvim-zh/colorful-winsep.nvim) -- Make your nvim window separators colorful
- [luukvbaal/statuscol.nvim](https://github.com/luukvbaal/statuscol.nvim) -- Status column plugin that provides a configurable )statuscolumn) and click handlers.
- [NvChad/nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua) -- A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim) -- 💥 Create key bindings that stick. WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type.

###### [Bekaboo/dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim)

> IDE-like breadcrumbs, out of the box

| Shortcut |       Action        |
| :------: | :-----------------: |
|   `\d`   |        pick         |
|   `[c`   | goto context start  |
|   `]c`   | select next context |

###### [kevinhwang91/nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)

> Not UFO in the sky, but an ultra fold in Neovim.petertriho/nvim-scrollbar) -- Extensible Neovim Scrollbar

| Shortcut |         Action          |
| :------: | :---------------------: |
|   `zR`   |     open all folds      |
|   `zM`   |     close all folds     |
|   `zr`   | open folds except kinds |
|   `zk`   |   preview folded maps   |

###### [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)

> A fancy, configurable, notification manager for NeoVim

|  Shortcut   |     Action     |
| :---------: | :------------: |
| `space` `;` | notify history |

###### [mbbill/undotree](https://github.com/mbbill/undotree)

> The undo history visualizer for VIM

| Shortcut |     Action      |
| :------: | :-------------: |
|   `L`    | Undotree toggle |

###### [FeiyouG/commander.nvim](https://github.com/FeiyouG/commander.nvim)

> Create and manage keybindings and commands in a more organized manner, and search them quickly through Telescope

|  Shortcut  |       Action        |
| :--------: | :-----------------: |
| `ctrl` `q` | telescope commander |

###### [vim-scripts/Tabmerge](https://github.com/vim-scripts/Tabmerge)

> Merge a tab)s windows with the current tab

|  Shortcut   |  Action   |
| :---------: | :-------: |
| `t` `m` `e` | Tab merge |

###### [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua)

> Improved fzf.vim written in lua

|  Shortcut  |  Action  |
| :--------: | :------: |
| `ctrl` `f` | fzf grep |

###### [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

> Find, Filter, Preview, Pick. All lua, all the time.

|   Shortcut   |               Action                |
| :----------: | :---------------------------------: |
|  `ctrl` `t`  |           telescope tabs            |
|  `ctrl` `p`  |        telescope find files         |
| `space` `rs` |          telescope resume           |
|  `ctrl` `w`  |          telescope buffers          |
|  `ctrl` `h`  |         telescope oldfiles          |
|  `ctrl` `_`  | telescope current_buffer_fuzzy_find |
|   `z` `=`    |       telescope spell_suggest       |
| `space` `d`  |        telescope diagnostics        |
|   `\` `g`    |        telescope git_status         |
|     `:`      |         telescope commands          |

###### [folke/flash.nvim](https://github.com/folke/flash.nvim)

> Navigate your code with search labels, enhanced character motions and Treesitter integration

| Shortcut |      Action      |
| :------: | :--------------: |
|  `esc`   |    flash jump    |
|   `T`    | flash treesitter |

###### [pechorin/any-jump.vim](https://github.com/pechorin/any-jump.vim)

> Jump to any definition and references 👁 IDE madness without overhead 🚀

| Shortcut |  Action  |
| :------: | :------: |
|   `j`    | any jump |

###### [kevinhwang91/nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens)

> Hlsearch Lens for Neovim

| Shortcut | Action                                        |
| -------- | --------------------------------------------- |
| `*`      | Search for the next word under the cursor     |
| `#`      | Search for the previous word under the cursor |
| `g*`     | Search for the next text under the cursor     |
| `g#`     | Search for the previous text under the cursor |

###### [RRethy/vim-illuminate](https://github.com/RRethy/vim-illuminate)

> automatically highlighting other uses of the current word under the cursor.

|  Shortcut   |          Action          |
| :---------: | :----------------------: |
| `space` `=` |   go to next reference   |
| `space` `-` | go to previous reference |

###### [kevinhwang91/rnvimr](https://github.com/kevinhwang91/rnvimr)

> use Ranger in a floating window

| Shortcut |   Action    |
| :------: | :---------: |
|   `R`    | open ranger |

###### [nvim-pack/nvim-spectre](https://github.com/nvim-pack/nvim-spectre)

> Find the enemy and replace them with dark power.

|  Shortcut   |    Action    |
| :---------: | :----------: |
| `space` `F` | open spectre |

###### [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

> Git integration for buffers

|   Shortcut   |               Action               |
| :----------: | :--------------------------------: |
| `space` `g-` |      `Gitsigns prev_hunk<CR>`      |
| `space` `g=` |      `Gitsigns next_hunk<CR>`      |
| `space` `gb` |     `Gitsigns blame_line<CR>`      |
| `space` `gr` |     `Gitsigns reset_hunk<CR>`      |
|     `H`      | `Gitsigns preview_hunk_inline<CR>` |

###### [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)

> Plugin for calling lazygit from within neovim.

|  Shortcut  |   Action    |
| :--------: | :---------: |
| `Ctrl` `g` | open laygit |

###### [Eandrju/cellular-automaton.nvim)](https://github.com/Eandrju/cellular-automaton.nvim)

> A useless plugin that might help you cope with stubbornly broken tests or overall lack of sense in life. It lets you execute aesthetically pleasing, cellular automaton animations based on the content of neovim buffer.

|   Shortcut   |             Action             |
| :----------: | :----------------------------: |
| `space` `rr` | CellularAutomaton game_of_life |

## Editor

- [yianwillis/vimcdoc](https://github.com/yianwillis/vimcdoc) -- vim chinese doc
- [dstein64/vim-startuptime](https://github.com/dstein64/vim-startuptime) -- A plugin for profiling Vim and Neovim startup time.
- [sjl/clam.vim](https://github.com/sjl/clam.vim) -- A lightweight Vim plugin for working with shell commands.
- [AmaiSaeta/capture.vim](https://github.com/AmaiSaeta/capture.vim) -- Capture ex-command output to new buffer.
- [theniceboy/antovim](https://github.com/theniceboy/antovim) -- Super-simple vim plugin for cycling through antonyms/words related to word under cursor. "gs"
- [gcmt/wildfire.vim](https://github.com/gcmt/wildfire.vim) -- Smart selection of the closest text object
- [lilydjwg/fcitx.vim](https://github.com/lilydjwg/fcitx.vim) -- keep and restore fcitx state when leaving/re-entering insert mode
- [ybian/smartim](https://github.com/ybian/smartim) -- A Vim plugin to make it stand well with input methods (Mac only)
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) -- autopairs for neovim written by lua
- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround) -- Add/change/delete surrounding delimiter pairs with ease. Written with ❤️ in Lua.
- [airblade/vim-rooter](https://github.com/airblade/vim-rooter) -- Changes Vim working directory to project root.

###### [godlygeek/tabular](https://github.com/godlygeek/tabular)

> vim script for text filtering and alignment

|    Shortcut     |    Action     |
| :-------------: | :-----------: |
|     `\` `t`     |  Tabularize   |
| `space` `a` `-` | Tabularize /= |

###### [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)

> Lightweight yet powerful formatter plugin for Neovim

| Shortcut | Action  |
| :------: | :-----: |
| `\` `f`  | conform |

###### [tomtom/tcomment_vim](https://github.com/tomtom/tcomment_vim)

> An extensible & universal comment vim-plugin that also handles embedded filetypes. in <space>cn to comment a line.

|    Shortcut     |  Action   |
| :-------------: | :-------: |
| `space` `c` `n` |  comment  |
| `space` `c` `u` | uncomment |

###### [fedepujol/move.nvim](https://github.com/fedepujol/move.nvim)

> Gain the power to move lines and blocks and auto-indent them!

|  Shortcut  |     Action     |
| :--------: | :------------: |
| `ctrl` `l` |  move line up  |
| `ctrl` `y` | move line down |

###### [gbprod/substitute.nvim](https://github.com/gbprod/substitute.nvim)

> Neovim plugin introducing a new operators motions to quickly replace and exchange text.

|   Shortcut   |              Action               |
| :----------: | :-------------------------------: |
|     `s`      |    substitute operator/visual     |
|     `ss`     |          substitute line          |
|     `sI`     |          substitute eol           |
| `space` `s`  | substitute ranger operator/visual |
| `space` `ss` |      substitute ranger word       |

###### [AckslD/nvim-neoclip](https://github.com/AckslD/nvim-neoclip)

> Clipboard manager neovim plugin with telescope integration

|  Shortcut   |      Action       |
| :---------: | :---------------: |
| `space` `y` | telescope neoclip |

###### [mg979/vim-visual-multi](https://github.com/mg979/vim-visual-multi)

> Multiple cursors plugin for vim/neovim

|    Shortcut     |     Action     |
| :-------------: | :------------: |
| `space` `s` `a` | vim select all |

## LSP

"iamcco/markdown-preview.nvim", -- markdown preview plugin for (neo)vim
"dhruvasagar/vim-table-mode", -- VIM Table Mode for instant table creation.

|    Shortcut     |      Action       |
| :-------------: | :---------------: |
| `space` `t` `m` | table moed toggle |

"mzlogin/vim-markdown-toc", -- A vim 7.4+ plugin to generate table of contents for Markdown files.
"dkarter/bullets.vim", -- 🔫Bullets.vim is a Vim/NeoVim plugin for automated bullet lists.
		"nvim-treesitter/nvim-treesitter", -- Nvim Treesitter configurations and abstraction layer
