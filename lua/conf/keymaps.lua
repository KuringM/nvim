local G = require('G')

local mode_nvo = {'n', 'v', 'o'}
local mode_n = {'n'}
local mode_i = {'i'}
local mode_v = {'v'}

-- nvim keymaps
G.g.mapleader = " "  -- Set <LEADER> as <SPACE>, ; as :
G.map({
	{ mode= mode_nvo, lhs= ';', rhs= ':' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'Q', rhs= ':q<CR>' , opt= { noremap = true } },  -- Quit
	{ mode= mode_nvo, lhs= 'S', rhs= ':w<CR>' , opt= { noremap = true } },  -- Save
	{ mode= mode_nvo, lhs= '<LEADER>r', rhs= ':source $MYVIMRC<CR>' , opt= { noremap = true } }, -- Roload VIMRC
	{ mode= mode_nvo, lhs= 'Y', rhs= 'y$' , opt= { noremap = true } },  -- make Y to copy till the end of the line
	{ mode= mode_v, lhs= 'Y', rhs= '\"+y' , opt= { noremap = true } },  -- Copy to system clipboard

	-- Movement
	{ mode= mode_nvo, lhs= 'u', rhs= 'k' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'e', rhs= 'j' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'n', rhs= 'h' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'i', rhs= 'l' , opt= { noremap = true } },
	-- U/E keys for 5 times u/e (faster navigation)
	{ mode= mode_nvo, lhs= 'U', rhs= '5k' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'E', rhs= '5j' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'N', rhs= '0' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'I', rhs= '$' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'gu', rhs= 'gk' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'ge', rhs= 'gj' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'h', rhs= 'e' , opt= { noremap = true } },  -- set h (same as n, cursor left) to 'end of word'
	-- Ctrl + U or E will move up/down the view port without moving the cursor
	{ mode= mode_nvo, lhs= '<C-U', rhs= '5<C-y>' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= '<C-E>', rhs= '5<C-e>' , opt= { noremap = true } },

	-- Actions
	{ mode= mode_nvo, lhs= 'l', rhs= 'u' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'k', rhs= 'i' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'K', rhs= 'I' , opt= { noremap = true } },

	-- Window management
	-- Use <space> + new arrow keys for moving the cursor around windows
	{ mode= mode_nvo, lhs= '<leader>w', rhs= '<C-w>w' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= '<leader>u', rhs= '<C-w>k' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= '<leader>e', rhs= '<C-w>j' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= '<leader>n', rhs= '<C-w>h' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= '<leader>i', rhs= '<C-w>l' , opt= { noremap = true } },

	-- Window & Split
	{ mode= mode_nvo, lhs= 's', rhs= '<nop>' , opt= { noremap = true } },  -- Disable the default s key
	-- split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
	{ mode= mode_nvo, lhs= 'su', rhs= ':set nosplitbelow<CR>:split<CR>:set splitbelow<CR>' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'se', rhs= ':set splitbelow<CR>:split<CR>' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'sn', rhs= ':set nosplitright<CR>:vsplit<CR>:set splitright<CR>' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'si', rhs= ':set splitright<CR>:vsplit<CR>' , opt= { noremap = true } },
	-- Resize splits with arrow keys
	{ mode= mode_nvo, lhs= '<up>', rhs= ':res +5<CR>' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= '<down>', rhs= ':res -5<CR>' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= '<left>', rhs= ':vertical resize-5<CR>' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= '<right>', rhs= ':vertical resize+5<CR>' , opt= { noremap = true } },
	-- Rotate screens
	{ mode= mode_nvo, lhs= 'sh', rhs= '<C-w>t<C-w>K' , opt= { noremap = true } },  -- Place two screens up and down
	{ mode= mode_nvo, lhs= 'sv', rhs= '<C-w>t<C-w>H' , opt= { noremap = true } },  -- Place the two screens side by side
	{ mode= mode_nvo, lhs= 'srh', rhs= '<C-w>b<C-w>K' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'srv', rhs= '<C-w>b<C-w>H' , opt= { noremap = true } },

	-- Tab management
	{ mode= mode_nvo, lhs= 'tU', rhs= ':Tabmerge<CR><C-w>t<C-w>H<C-w>l' , opt= { noremap = true } },  -- Merge two tabs
	{ mode= mode_nvo, lhs= 'tu', rhs= ':tabe<CR>' , opt= { noremap = true } },  -- Create a new tab with tu
	{ mode= mode_nvo, lhs= 'te', rhs= ':winc T<CR>' , opt= { noremap = true } }, -- Move a split page to a new tab
	-- Move around tabs with tn and ti
	{ mode= mode_nvo, lhs= 'tn', rhs= ':-tabnext<CR>' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'ti', rhs= ':+tabnext<CR>' , opt= { noremap = true } },
	-- Move the tabs with tmn and tmi
	{ mode= mode_nvo, lhs= 'tmn', rhs= ':-tabmove<CR>' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'tmi', rhs= ':+tabmove<CR>' , opt= { noremap = true } },

	-- Avoid those shortcut
	{ mode= mode_n, lhs= '<c-z>', rhs= ':u<CR>' , opt= { noremap = true } },
	{ mode= mode_i, lhs= '<c-z>', rhs= '<c-o>:u<CR>' , opt= { noremap = true } },
})
	-- { mode= mode_nvo, lhs= '<++>', rhs= '<++>' , opt= { noremap = true } },
