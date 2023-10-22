local set = vim.opt
-- Editor Setup

-- System
set.clipboard += 'unnamedplus'                  -- Copy paste between vim and everything else
-- let &t_ut=''                                -- empty to tell Vim it needs to draw the background color
set.autochdir = true                               -- Your working directory will always be the same as your working directory

-- Editor behavior
set.exrc           = true
set.secure         = true
set.number         = true                         -- Line numbers
set.relativenumber = true                         -- Line relative numbers
set.cursorline     = true                         -- Enable highlighting of the current line
set.hidden         = true                         -- Required to keep multiple buffers open multiple buffers
set.noexpandtab    = true                         -- Don't use softtabstop spaces instead of tab characters for indentation
set.tabstop        = 2                               -- <TAB> in file represent 2 space
set.shiftwidth     = 2                            -- Indent by 2 spaces when using >>, <<, == etc.
set.softtabstop    = 2                           -- Indent by 2 when pressing <TAB>
set.autoindent =true                              -- Keep indentation from previous line
set.list      = true                         -- Show space,tabs,newlines,trailing space,wrapped lines
set.listchars= 'tab:|\\ ,trail:▫'             -- Show char for tabs,trailing space
set.scrolloff=4                             -- Leave 4 lines down cursor"
set.ttimeoutlen=0                           -- No timeoutlen for preeing keys
set.notimeout = true                              -- No timeout
set.viewoptions='cursor,folds,slash,unix'
set.wrap =true                                   -- Text surround below line
set.tw=0                                    -- Maximum worth for inserting text
set.indentexpr= ''
set.foldmethod = 'indent'
set.foldlevel=99
set.foldenable = true
set.formatoptions = vim.o.formatoptions:gsub('tc', '')
set.splitright  = true                            -- Horizontal splits will automatically be below
set.splitbelow  = true                            -- Vertical splits will automatically be to the right
set.noshowmode  = true                            -- We don't need to see things like -- INSERT -- anymore
set.showcmd     = true
set.wildmenu    = true
set.ignorecase  = true
set.smartcase   = true
set.shortmess   = vim.o.shortmess .. 'c'                            -- Don't pass messages to |ins-completion-menu|.
set.inccommand  = split
set.completeopt = 'longest,noinsert,menuone,noselect,preview'
set.ttyfast     = true                            -- should make scrolling faster
set.lazyredraw  = true                            -- same as above
set.visualbell  = true 
set.colorcolumn=100
set.updatetime=100                          -- Faster completion
set.virtualedit= 'block'
-- set fileencoding
set.fileencodings='utf-8,ucs-bom,gb18030,gbk,gb2312,cp936'
set.termencoding='utf-8'
set.encoding='utf-8'
-- set spell check identify en_us and cjk
set.spelllang='en_us,cjk'
set.nocompatible = true 
-- ban markdown markdown_recommended_style, like expandtab tabstop=4 softtabstop=4 shiftwidth=4!
vim.g.markdown_recommended_style = 0

vim.cmd([[
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
" silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif
]])

-- auto spell
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.md", command = "setlocal spell", })
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = "silent! lcd %:p:h", })

vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

vim.g.terminal_color_0  = '#000000'
vim.g.terminal_color_1  = '#FF5555'
vim.g.terminal_color_2  = '#50FA7B'
vim.g.terminal_color_3  = '#F1FA8C'
vim.g.terminal_color_4  = '#BD93F9'
vim.g.terminal_color_5  = '#FF79C6'
vim.g.terminal_color_6  = '#8BE9FD'
vim.g.terminal_color_7  = '#BFBFBF'
vim.g.terminal_color_8  = '#4D4D4D'
vim.g.terminal_color_9  = '#FF6E67'
vim.g.terminal_color_10 = '#5AF78E'
vim.g.terminal_color_11 = '#F4F99D'
vim.g.terminal_color_12 = '#CAA9FA'
vim.g.terminal_color_13 = '#FF92D0'
vim.g.terminal_color_14 = '#9AEDFE'
vim.cmd([[autocmd TermOpen term://* startinsert]])
vim.cmd([[
augroup NVIMRC
    autocmd!
    autocmd BufWritePost .vim.lua exec ":so %"
augroup END
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
]])

vim.cmd([[hi NonText ctermfg=gray guifg=grey10]])

-- load machine_specific configrations
local config_path = vim.fn.stdpath("config")
local current_config_path = config_path .. "/lua/conf/machine_specific.lua"
if not vim.loop.fs_stat(current_config_path) then
	local current_config_file = io.open(current_config_path, "wb")
	local default_config_path = config_path .. "/lua/_machine_specific_default.lua"
	local default_config_file = io.open(default_config_path, "rb")
	if default_config_file and current_config_file then
		local content = default_config_file:read("*all")
		current_config_file:write(content)
		io.close(default_config_file)
		io.close(current_config_file)
	end
end
require("conf.machine_specific")
