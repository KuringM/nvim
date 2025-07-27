local G = require("G")
local mode_nvo = { "n", "v", "o" }
local mode_n = { "n" }
local mode_i = { "i" }
local mode_v = { "v" }
local mode_c = { "c" }

------------------------------------------------------------------------
--                            NVIM Keymaps                            --
------------------------------------------------------------------------

G.g.mapleader = " " -- Set <LEADER> as <SPACE>
vim.g.maplocalleader = "\\" -- Set <LocalLeader> as \
G.map({

	------------------------------------------------------------------------
	--                  Normal, Visual, Operator-pending                  --
	------------------------------------------------------------------------

	{ mode_nvo , "u"            , "k"                      , { noremap = true } } ,
	{ mode_nvo , "e"            , "j"                      , { noremap = true } } ,
	{ mode_nvo , "n"            , "h"                      , { noremap = true } } ,
	{ mode_nvo , "i"            , "l"                      , { noremap = true } } ,
	{ mode_nvo , "U"            , "5k"                     , { noremap = true } } , -- U/E keys for 5 times u/e (faster navigation)
	{ mode_nvo , "E"            , "5j"                     , { noremap = true } } ,
	{ mode_nvo , "N"            , "0"                      , { noremap = true } } ,
	{ mode_nvo , "I"            , "$"                      , { noremap = true } } ,
	{ mode_nvo , "gu"           , "gk"                     , { noremap = true } } ,
	{ mode_nvo , "ge"           , "gj"                     , { noremap = true } } ,
	{ mode_nvo , "<C-U>"        , "5<C-Y>"                 , { noremap = true } } , -- Ctrl + U or E will move up/down the view port without moving the cursor
	{ mode_nvo , "<C-E>"        , "5<C-E>"                 , { noremap = true } } ,
	{ mode_nvo , "<C-C>"        , "zz"                     , { noremap = true } } , -- cursor line move to the middle window
	{ mode_nvo , "-"            , "N"                      , { noremap = true } } , -- Search preview
	{ mode_nvo , "="            , "n"                      , { noremap = true } } , -- Search next
	{ mode_nvo , "<up>"         , ":res +5<CR>"            , { noremap = true } } , -- Resize Windows with arrow keys
	{ mode_nvo , "<down>"       , ":res -5<CR>"            , { noremap = true } } ,
	{ mode_nvo , "<left>"       , ":vertical resize-5<CR>" , { noremap = true } } ,
	{ mode_nvo , "<right>"      , ":vertical resize+5<CR>" , { noremap = true } } ,
	{ mode_nvo , "Q"            , ":q<CR>"                 , { noremap = true } } , -- Quit
	{ mode_nvo , "l"            , "u"                      , { noremap = true } } , -- undo
	{ mode_n   , "Y"            , "y$"                     , { noremap = true } } , -- make Y to copy till the end of the line
	{ mode_v   , "Y"            , '"+y'                    , { noremap = true } } , -- Copy to system clipboard
	{ mode_nvo , "P"            , ":pu<CR>"                , { noremap = true } } , -- Paste in a new line
	{ mode_nvo , "s"            , "<nop>"                  , { noremap = true } } , -- Disable the default s key
	{ mode_nvo , "S"            , ":w<CR>"                 , { noremap = true } } , -- Save
	{ mode_nvo , "h"            , "e"                      , { noremap = true } } , -- set h (same as n, cursor left) to 'end of word'
	{ mode_nvo , "k"            , "i"                      , { noremap = true } } , -- insert
	{ mode_nvo , "K"            , "I"                      , { noremap = true } } ,
	{ mode_nvo , "gl"           , "gu"                     , { noremap = true } } ,
	{ mode_nvo , "gL"           , "gU"                     , { noremap = true } } , -- 跨越的文本成为大写. 
	{ mode_n   , "<"            , "<<"                     , { noremap = true } } , -- Shift [count] lines one 'shiftwidth' leftwards.
	{ mode_n   , ">"            , ">>"                     , { noremap = true } } ,
	{ mode_nvo , ";"            , ":"                      , { noremap = true } } ,
	{ mode_nvo , "`"            , "~"                      , { noremap = true } } , -- 切换光标下字符的大小写, 并把光标向右移
	{ mode_nvo , "<leader><CR>" , ":nohlsearch<CR>"        , { noremap = true } } , -- No highlight!
	{ mode_nvo , "<leader>sc"   , ":set spell!<CR>"        , { noremap = true } } , -- Spelling Check with <space>sc
	{ mode_nvo , "<leader>sw"   , ":set wrap!<CR>"         , { noremap = true } } , -- set wrap
	{ mode_nvo , "<leader>."    , "@:"                     , { noremap = true } } , -- repeat last commnad-line change
	{ mode_nvo , "<LEADER>r"    , ":source $MYVIMRC<CR>"   , { noremap = true } } , -- Roload VIMRC
	{ mode_nvo , "<leader>dw"   , [[/\(\<\w\+\>\)\_s*\1]]  , { noremap = true } } , -- Adjacent duplicate words
	{ mode_n   , [[\s]]         , ":%s//g<left><left>"     , { noremap = true } } ,
	{ mode_v   , [[\s]]         , ":s//g<left><left>"      , { noremap = true } } ,
	{ mode_nvo , "tx"           , ":r !figlet "            , { noremap = true } } , -- Call figlet
	{ mode_n   , "<C-Z>"        , ":u<CR>"                 , { noremap = true } } ,
	{ mode_nvo , "<F10>"        , ":Inspect<CR>"           , { noremap = true } } , -- show the highlight group under the cursor

	-------------------------------
	--       Split Windows       --
	-------------------------------

	{ mode_nvo , "su"        , ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>"  , { noremap = true } } ,
	{ mode_nvo , "se"        , ":set splitbelow<CR>:split<CR>"                       , { noremap = true } } ,
	{ mode_nvo , "sn"        , ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>" , { noremap = true } } ,
	{ mode_nvo , "si"        , ":set splitright<CR>:vsplit<CR>"                      , { noremap = true } } ,
	{ mode_nvo , "<leader>w" , "<C-W>w"                                              , { noremap = true } } , -- Use <space> + new arrow keys for moving the cursor around windows
	{ mode_nvo , "<leader>u" , "<C-W>k"                                              , { noremap = true } } ,
	{ mode_nvo , "<leader>e" , "<C-W>j"                                              , { noremap = true } } ,
	{ mode_nvo , "<leader>n" , "<C-W>h"                                              , { noremap = true } } ,
	{ mode_nvo , "<leader>i" , "<C-W>l"                                              , { noremap = true } } ,
	{ mode_nvo , "sh"        , "<C-W>K"                                              , { noremap = true } } , -- Place two screens up and down / Move nowSplitWindow to 1st
	{ mode_nvo , "sv"        , "<C-W>H"                                              , { noremap = true } } , -- Place the two screens side by side / Move nowSplitWindow to 1st
	{ mode_nvo , "sr"        , "<C-W>x"                                              , { noremap = true } } , -- Swap the current window with the next window
	{ mode_nvo , "smu"       , "<C-W>K"                                              , { noremap = true } } , -- Move split windows
	{ mode_nvo , "sme"       , "<C-W>J"                                              , { noremap = true } } ,
	{ mode_nvo , "smn"       , "<C-W>H"                                              , { noremap = true } } ,
	{ mode_nvo , "smi"       , "<C-W>L"                                              , { noremap = true } } ,

	-------------------------------
	--            Tab            --
	-------------------------------

	{ mode_nvo , "tu"  , ":tabe<CR>"     , { noremap = true } } , -- Create a new tab with tu
	{ mode_nvo , "te"  , ":winc T<CR>"   , { noremap = true } } , -- Move a split page to a new tab
	{ mode_nvo , "tn"  , ":-tabnext<CR>" , { noremap = true } } ,
	{ mode_nvo , "ti"  , ":+tabnext<CR>" , { noremap = true } } ,
	{ mode_nvo , "tmn" , ":-tabmove<CR>" , { noremap = true } } ,
	{ mode_nvo , "tmi" , ":+tabmove<CR>" , { noremap = true } } ,

	------------------------------------------------------------------------
	--                              Commnad                               --
	------------------------------------------------------------------------

	{ mode_c , "<C-A>" , "<Home>"    , { noremap = true } } , -- move cursor to the beginning
	{ mode_c , "<C-O>" , "<End>"     , { noremap = true } } , -- move cursor to the ending
	{ mode_c , "<C-U>" , "<Up>"      , { noremap = true } } , -- history up
	{ mode_c , "<C-E>" , "<Down>"    , { noremap = true } } , -- history down
	-- { mode_c , "<C-N>" , "<Left>"    , { noremap = true } } , -- move cursor left
	-- { mode_c , "<C-I>" , "<Right>"   , { noremap = true } } , -- move cursor left "neovm use libtermkey"
	{ mode_c , "<C-B>" , "<S-Left>"  , { noremap = true } } , -- move cursor left one word
	{ mode_c , "<C-W>" , "<S-Right>" , { noremap = true } } , -- move cursor right one word
	{ mode_c , "<C-L>" , "<C-W>"     , { noremap = true } } , -- delete the word before the cursor
	{ mode_c , "<C-H>" , "<C-U>"     , { noremap = true } } , -- detete all before the cursor

	------------------------------------------------------------------------
	--                               Insert                               --
	------------------------------------------------------------------------

	{ mode_i , "<C-A>" , "<ESC>A"      , { noremap = true } } , -- Move to the line END
	{ mode_i , "<C-V>" , "<C-R>*"      , { noremap = true } } , -- Paste in Insert Mode
	{ mode_i , "<C-Z>" , "<C-O>:u<CR>" , { noremap = true } } , -- Avoid those shortcut
	{ mode_i , "<C-L>" , "<C-W>" ,       { noremap = true } } , -- delete words
	{ mode_i , "<C-M>" , "<Right>" ,     { noremap = true } } , -- Right
	{ mode_i , "<C-K>" , "<Left>" ,      { noremap = true } } , -- Left
})

-- close win below
local function run_vim_shortcut(shortcut)
	local escaped_shortcut = vim.api.nvim_replace_termcodes(shortcut, true, false, true)
	vim.api.nvim_feedkeys(escaped_shortcut, "n", true)
end
vim.keymap.set("n", "<leader>q", function()
	require("trouble").close()
	local wins = vim.api.nvim_tabpage_list_wins(0)
	if #wins > 1 then
		run_vim_shortcut([[<C-W>j:q<CR>]])
	end
end, { noremap = true, silent = true })

-- Move the character under the cursor to before the next $ sign
local function move_char_before_dollar()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()

  -- 如果光标超出行尾, 退出
  if col >= #line then return end

  local char = line:sub(col + 1, col + 1)
  local line_before = line:sub(1, col)
  local line_after = line:sub(col + 2)

  -- 查找下一个 `$` 符号的位置(相对 line_after)
  local rel_dollar_pos = line_after:find("%$")
  if not rel_dollar_pos then return end

  -- 拼接:删除当前字符, 将其插入到 $ 前
  local dollar_index = col + rel_dollar_pos
  local new_line = line_before .. line_after:sub(1, rel_dollar_pos - 1) .. char .. line_after:sub(rel_dollar_pos)

  vim.api.nvim_set_current_line(new_line)
  -- 保持光标在原位置(不跳到插入处)
  vim.api.nvim_win_set_cursor(0, { row, col })
end

-- Insert 模式映射 <C-y>
vim.keymap.set("i", "<C-y>", function()
  move_char_before_dollar()
end, { noremap = true, silent = true })
