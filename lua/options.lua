vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
vim.opt.clipboard:append {'unnamedplus'}           -- Copy paste between vim and everything else
vim.opt.autochdir      = true                      -- Your working directory will always be the same as your working directory
vim.o.incsearch        = true
vim.opt.exrc           = true
vim.opt.secure         = true
vim.opt.number         = true                      -- Line numbers
vim.opt.relativenumber = true                      -- Line relative numbers
vim.opt.cursorline     = true                      -- Enable highlighting of the current line
vim.opt.hidden         = true                      -- Required to keep multiple buffers open multiple buffers
vim.o.expandtab        = false                      -- Don't use softtabstop spaces instead of tab characters for indentation
vim.o.smarttab         = true
vim.opt.tabstop        = 2                         -- <TAB> in file represent 2 space
vim.opt.shiftwidth     = 2                         -- Indent by 2 spaces when using >>, <<,== etc.
vim.opt.softtabstop    = 2                         -- Indent by 2 when pressing <TAB>
vim.opt.autoindent     = true                      -- Keep indentation from previous line
vim.opt.list           = true                      -- Show space,tabs,newlines,trailing space,wrapped lines
vim.opt.listchars      = 'tab:|\\ ,trail:▫'        -- Show char for tabs,trailing space
vim.opt.scrolloff      = 4                         -- Leave 4 lines down cursor"
vim.opt.ttimeoutlen    = 0                         -- No timeoutlen for preeing keys
vim.opt.timeout        = true                      -- No timeout
vim.opt.viewoptions    = 'cursor,folds,slash,unix'
vim.opt.wrap           = true                      -- Text surround below line
vim.opt.tw             = 0                         -- Maximum worth for inserting text
vim.opt.indentexpr     = ''
vim.opt.foldmethod     = 'indent'
vim.opt.foldlevel      = 99
vim.opt.foldenable     = true
vim.o.foldlevelstart   = 99
vim.opt.formatoptions  = vim.o.formatoptions:gsub('tc', '')
vim.opt.splitright     = true                      -- Horizontal splits will automatically be below
vim.opt.splitbelow     = true                      -- Vertical splits will automatically be to the right
-- vim.o.noshowmode       = true                      -- We don't need to see things like -- INSERT -- anymore
vim.opt.showcmd        = true
vim.opt.wildmenu       = true
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.shortmess      = vim.o.shortmess .. 'c'    -- Don't pass messages to |ins-completion-menu|.
vim.opt.inccommand     = 'split'
vim.opt.completeopt    = 'longest,noinsert,menuone,noselect,preview'
vim.o.completeopt      = 'menuone,noinsert,noselect,preview'
vim.opt.ttyfast        = true                      -- should make scrolling faster
vim.opt.lazyredraw     = true                      -- same as above
vim.opt.visualbell     = true
vim.opt.colorcolumn    = '100'
vim.opt.updatetime     = 100                       -- Faster completion
vim.opt.virtualedit    = 'block'
-- vim.opt fileencoding
vim.opt.fileencodings = 'utf-8,ucs-bom,gb18030,gbk,gb2312,cp936'
-- vim.opt.termencoding  = 'utf-8'
vim.opt.encoding      = 'utf-8'
-- vim.opt spell check identify en_us and cjk
vim.opt.spelllang     = 'en_us,cjk'
vim.o.compatible      = false

-- Add a tmp directory for backup
vim.cmd([[
silent !mkdir -p $HOME/.cache/nvim/tmp/backup
silent !mkdir -p $HOME/.cache/nvim/tmp/undo
" silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.cache/nvim/tmp/backup,.
set directory=$HOME/.cache/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.cache/nvim/tmp/undo,.
endif
]])

-- Auto change directory to current dir
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = "lcd %:p:h", })

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
local current_config_path = config_path .. "/lua/machine_specific.lua"
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
require("machine_specific")
