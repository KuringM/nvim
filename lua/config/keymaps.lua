local G = require("G")
local mode_nvo = { "n", "v", "o" }
local mode_n = { "n" }
local mode_i = { "i" }
local mode_v = { "v" }
local mode_c = { "c" }

	------------------------------------------------------------------------
	--                            NVIM Keymaps                            --
	------------------------------------------------------------------------

G.g.mapleader = " " -- Set <LEADER> as <SPACE>, ; as :
G.map({

	------------------------------------------------------------------------
	--                  Normal, Visual, Operator-pending                  --
	------------------------------------------------------------------------

	{ mode = mode_nvo, lhs = "u",            rhs = "k",                      opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "e",            rhs = "j",                      opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "n",            rhs = "h",                      opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "i",            rhs = "l",                      opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "U",            rhs = "5k",                     opt = { noremap = true } }, -- U/E keys for 5 times u/e (faster navigation)
	{ mode = mode_nvo, lhs = "E",            rhs = "5j",                     opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "N",            rhs = "0",                      opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "I",            rhs = "$",                      opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "gu",           rhs = "gk",                     opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "ge",           rhs = "gj",                     opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "<C-U>",        rhs = "5<C-Y>",                 opt = { noremap = true } }, -- Ctrl + U or E will move up/down the view port without moving the cursor
	{ mode = mode_nvo, lhs = "<C-E>",        rhs = "5<C-E>",                 opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "<C-C>",        rhs = "zz",                     opt = { noremap = true } }, -- cursor line move to the middle window
	{ mode = mode_nvo, lhs = "-",            rhs = "N",                      opt = { noremap = true } }, -- Search preview
	{ mode = mode_nvo, lhs = "=",            rhs = "n",                      opt = { noremap = true } }, -- Search next
	{ mode = mode_nvo, lhs = "<up>",         rhs = ":res +5<CR>",            opt = { noremap = true } }, -- Resize Windows with arrow keys
	{ mode = mode_nvo, lhs = "<down>",       rhs = ":res -5<CR>",            opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "<left>",       rhs = ":vertical resize-5<CR>", opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "<right>",      rhs = ":vertical resize+5<CR>", opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "Q",            rhs = ":q<CR>",                 opt = { noremap = true } }, -- Quit
	{ mode = mode_nvo, lhs = "l",            rhs = "u",                      opt = { noremap = true } }, -- undo
	{ mode = mode_n,   lhs = "Y",            rhs = "y$",                     opt = { noremap = true } }, -- make Y to copy till the end of the line
	{ mode = mode_v,   lhs = "Y",            rhs = '"+y',                    opt = { noremap = true } }, -- Copy to system clipboard
	{ mode = mode_nvo, lhs = "s",            rhs = "<nop>",                  opt = { noremap = true } }, -- Disable the default s key
	{ mode = mode_nvo, lhs = "S",            rhs = ":w<CR>",                 opt = { noremap = true } }, -- Save
	{ mode = mode_nvo, lhs = "h",            rhs = "e",                      opt = { noremap = true } }, -- set h (same as n, cursor left) to 'end of word'
	{ mode = mode_nvo, lhs = "k",            rhs = "i",                      opt = { noremap = true } }, -- insert
	{ mode = mode_nvo, lhs = "K",            rhs = "I",                      opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "gl",           rhs = "gu",                     opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "gL",           rhs = "gU",                     opt = { noremap = true } }, -- 跨越的文本成为大写。
	{ mode = mode_n,   lhs = "<",            rhs = "<<",                     opt = { noremap = true } }, -- Shift [count] lines one 'shiftwidth' leftwards.
	{ mode = mode_n,   lhs = ">",            rhs = ">>",                     opt = { noremap = true } },
	{ mode = mode_nvo, lhs = ";",            rhs = ":",                      opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "`",            rhs = "~",                      opt = { noremap = true } }, -- 切换光标下字符的大小写，并把光标向右移
	{ mode = mode_nvo, lhs = "<leader><CR>", rhs = ":nohlsearch<CR>",        opt = { noremap = true } }, -- No highlight!
	{ mode = mode_nvo, lhs = "<leader>sc",   rhs = ":set spell!<CR>",        opt = { noremap = true } }, -- Spelling Check with <space>sc
	{ mode = mode_nvo, lhs = "<leader>sw",   rhs = ":set wrap!<CR>",         opt = { noremap = true } }, -- set wrap
	{ mode = mode_nvo, lhs = "<leader>.",    rhs = "@:",                     opt = { noremap = true } }, -- repeat last commnad-line change
	{ mode = mode_nvo, lhs = '<LEADER>r',    rhs = ':source $MYVIMRC<CR>',   opt = { noremap = true } }, -- Roload VIMRC
	{ mode = mode_nvo, lhs = '<leader>dw',   rhs = [[/\(\<\w\+\>\)\_s*\1]],  opt = { noremap = true } }, -- Adjacent duplicate words
	{ mode = mode_n,   lhs = [[\s]],         rhs = ":%s//g<left><left>",     opt = { noremap = true } },
	{ mode = mode_v,   lhs = [[\s]],         rhs = ":s//g<left><left>",      opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "tx",           rhs = ":r !figlet ",            opt = { noremap = true } }, -- Call figlet
	{ mode = mode_n,   lhs = "<C-Z>",        rhs = ":u<CR>",                 opt = { noremap = true } },

	-------------------------------
	--       Split Windows       --
	-------------------------------

	{ mode = mode_nvo, lhs = "su",        rhs = ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>",  opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "se",        rhs = ":set splitbelow<CR>:split<CR>",                       opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "sn",        rhs = ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "si",        rhs = ":set splitright<CR>:vsplit<CR>",                      opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "<leader>w", rhs = "<C-W>w", opt = { noremap = true } }, -- Use <space> + new arrow keys for moving the cursor around windows
	{ mode = mode_nvo, lhs = "<leader>u", rhs = "<C-W>k", opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "<leader>e", rhs = "<C-W>j", opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "<leader>n", rhs = "<C-W>h", opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "<leader>i", rhs = "<C-W>l", opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "sh",        rhs = "<C-W>K", opt = { noremap = true } }, -- Place two screens up and down / Move nowSplitWindow to 1st
	{ mode = mode_nvo, lhs = "sv",        rhs = "<C-W>H", opt = { noremap = true } }, -- Place the two screens side by side / Move nowSplitWindow to 1st
	{ mode = mode_nvo, lhs = "sr",        rhs = "<C-W>x", opt = { noremap = true } }, -- Swap the current window with the next window
	{ mode = mode_nvo, lhs = "smu",       rhs = "<C-W>K", opt = { noremap = true } }, -- Move split windows
	{ mode = mode_nvo, lhs = "sme",       rhs = "<C-W>J", opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "smn",       rhs = "<C-W>H", opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "smi",       rhs = "<C-W>L", opt = { noremap = true } },

	-------------------------------
	--            Tab            --
	-------------------------------

	{ mode = mode_nvo, lhs = "tu",  rhs = ":tabe<CR>",     opt = { noremap = true } }, -- Create a new tab with tu
	{ mode = mode_nvo, lhs = "te",  rhs = ":winc T<CR>",   opt = { noremap = true } }, -- Move a split page to a new tab
	{ mode = mode_nvo, lhs = "tn",  rhs = ":-tabnext<CR>", opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "ti",  rhs = ":+tabnext<CR>", opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "tmn", rhs = ":-tabmove<CR>", opt = { noremap = true } },
	{ mode = mode_nvo, lhs = "tmi", rhs = ":+tabmove<CR>", opt = { noremap = true } },

	------------------------------------------------------------------------
	--                              Commnad                               --
	------------------------------------------------------------------------

	{ mode = mode_c, lhs = "<C-A>", rhs = "<Home>",    opt = { noremap = true } }, -- move cursor to the beginning
	{ mode = mode_c, lhs = "<C-O>", rhs = "<End>",     opt = { noremap = true } }, -- move cursor to the ending
	{ mode = mode_c, lhs = "<C-U>", rhs = "<Up>",      opt = { noremap = true } }, -- history up
	{ mode = mode_c, lhs = "<C-E>", rhs = "<Down>",    opt = { noremap = true } }, -- history down
	{ mode = mode_c, lhs = "<C-N>", rhs = "<Left>",    opt = { noremap = true } }, -- move cursor left
	{ mode = mode_c, lhs = '<C-I>', rhs = '<Right>',   opt = { noremap = true } }, -- move cursor left "neovm use libtermkey"
	{ mode = mode_c, lhs = '<C-F>', rhs = '<S-Left>',  opt = { noremap = true } }, -- move cursor left one word
	{ mode = mode_c, lhs = '<C-W>', rhs = '<S-Right>', opt = { noremap = true } }, -- move cursor right one word
	{ mode = mode_c, lhs = '<C-L>', rhs = '<C-W>',     opt = { noremap = true } }, -- delete the word before the cursor
	{ mode = mode_c, lhs = '<C-H>', rhs = '<C-U>',     opt = { noremap = true } }, -- detete all before the cursor

	------------------------------------------------------------------------
	--                               Insert                               --
	------------------------------------------------------------------------

	{ mode = mode_i, lhs = "<C-A>", rhs = "<ESC>A",      opt = { noremap = true } },  -- Move to the line END
	{ mode = mode_i, lhs = "<C-V>", rhs = "<C-R>*",      opt = { noremap = true } }, -- Paste in Insert Mode
	{ mode = mode_i, lhs = "<c-Z>", rhs = "<C-O>:u<CR>", opt = { noremap = true } }, -- Avoid those shortcut
})

-- close win below
local function run_vim_shortcut(shortcut)
	local escaped_shortcut = vim.api.nvim_replace_termcodes(shortcut, true, false, true)
	vim.api.nvim_feedkeys(escaped_shortcut, 'n', true)
end
vim.keymap.set("n", "<leader>q", function()
	require("trouble").close()
	local wins = vim.api.nvim_tabpage_list_wins(0)
	if #wins > 1 then
		run_vim_shortcut([[<C-W>j:q<CR>]])
	end
end, { noremap = true, silent = true })

-- Move the next character to the end of the line with ctrl+u in Insert Mode.
vim.cmd([[
fun! s:MakePair()
	let line = getline('.')
	let len = strlen(line)
	if line[len - 1] == ";" || line[len - 1] == ","
		normal! lx$P
	else
		normal! lx$p
	endif
endfun
inoremap <C-U> <ESC>:call <SID>MakePair()<CR>
]])
