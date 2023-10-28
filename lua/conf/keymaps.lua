local G = require('G')

local mode_nvo = {'n', 'v', 'o'}
local mode_n = {'n'}
local mode_i = {'i'}
local mode_v = {'v'}
local mode_c = {'c'}

-- nvim keymaps
G.g.mapleader = " "  -- Set <LEADER> as <SPACE>, ; as :
G.map({
	-- Normal Remap
	{ mode= mode_nvo, lhs= ';', rhs= ':' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= '`', rhs= '~' , opt= { noremap = true } },  -- 切换光标下字符的大小写，并把光标向右移
	-- Remap Actions
	{ mode= mode_nvo, lhs= 'l', rhs= 'u' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'k', rhs= 'i' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'K', rhs= 'I' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'Q', rhs= ':q<CR>' , opt= { noremap = true } },  -- Quit
	{ mode= mode_nvo, lhs= 'S', rhs= ':w<CR>' , opt= { noremap = true } },  -- Save
	{ mode= mode_n, lhs= 'Y', rhs= 'y$' , opt= { noremap = true } },  -- make Y to copy till the end of the line
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
	{ mode= mode_nvo, lhs= '<C-c>', rhs= 'zz' , opt= { noremap = true } },  -- cursor line move to the middle window

	-- Movement in Command
	{ mode= mode_c, lhs= '<C-a>', rhs= '<Home>' , opt= { noremap = true } },
	{ mode= mode_c, lhs= '<C-o>', rhs= '<End>' , opt= { noremap = true } },
	{ mode= mode_c, lhs= '<C-u>', rhs= '<Up>' , opt= { noremap = true } },
	{ mode= mode_c, lhs= '<C-e>', rhs= '<Down>' , opt= { noremap = true } },
	{ mode= mode_c, lhs= '<C-n>', rhs= '<Left>' , opt= { noremap = true } },
	-- { mode= mode_c, lhs= '<C-i>', rhs= '<Right>' , opt= { noremap = true } },
	{ mode= mode_c, lhs= '<C-b>', rhs= '<S-Left>' , opt= { noremap = true } },
	{ mode= mode_c, lhs= '<C-w>', rhs= '<S-Right>' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'tx', rhs= ':r !figlet' , opt= { noremap = true } },  -- Call figlet

	--  Movement in Insert Mode
	{ mode= mode_i, lhs= '<C-a>', rhs= '<ESC>A' , opt= { noremap = true } },  -- Move to the line home

	-- Movement in Split Windows
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

	-- Super LEADER
	-- { mode= mode_nvo, lhs= '<LEADER>r', rhs= ':source $MYVIMRC<CR>' , opt= { noremap = true } }, -- Roload VIMRC
	{ mode= mode_nvo, lhs= '<leader>o', rhs= 'za' , opt= { noremap = true,  silent= true} },  -- Folding
	{ mode= mode_nvo, lhs= '<leader>sc', rhs= ':set spell!<CR>' , opt= { noremap = true } },  -- Spelling Check with <space>sc
	{ mode= mode_nvo, lhs= '<leader>sw', rhs= ':set wrap<CR>' , opt= { noremap = true } },  -- set wrap

	-- unshown in cw maps
	-- unshown in cw maps
	{ mode= mode_n, lhs= '<', rhs= '<<' , opt= { noremap = true } },
	{ mode= mode_n, lhs= '>', rhs= '>>' , opt= { noremap = true } },
	-- { mode= mode_nvo, lhs= '<leader>dw', rhs= '/\(\<\w\+\>\)\_s*\1' , opt= { noremap = true } },  -- Adjacent duplicate words
	{ mode= mode_nvo, lhs= '<leader><CR>', rhs= ':nohlsearch<CR>' , opt= { noremap = true } },  -- Search no highlight
	-- Space to Tab
	{ mode= mode_n, lhs= '<leader>tt', rhs= ':%s/    /\t/g' , opt= { noremap = true } },
	{ mode= mode_v, lhs= '<leader>tt', rhs= ':s/    /\t/g' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= '-', rhs= 'N' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= '=', rhs= 'n' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'gl', rhs= 'gu' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= 'gL', rhs= 'gU' , opt= { noremap = true } },  -- 跨越的文本成为大写。
	-- find and replace
	{ mode= mode_n, lhs= [[\s]], rhs= ':%s//g<left><left>' , opt= { noremap = true } },
	{ mode= mode_v, lhs= [[\s]], rhs= ':s//g<left><left>' , opt= { noremap = true } },
	{ mode= mode_nvo, lhs= '<++>', rhs= '<++>' , opt= { noremap = true } },

})

local function run_vim_shortcut(shortcut)
	local escaped_shortcut = vim.api.nvim_replace_termcodes(shortcut, true, false, true)
	vim.api.nvim_feedkeys(escaped_shortcut, 'n', true)
end

-- close win below
vim.keymap.set("n", "<leader>q", function()
	vim.cmd("TroubleClose")
	local wins = vim.api.nvim_tabpage_list_wins(0)
	if #wins > 1 then
		run_vim_shortcut([[<C-w>j:q<CR>]])
	end
end, { noremap = true, silent = true })
