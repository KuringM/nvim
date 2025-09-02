vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
vim.opt.clipboard:append {'unnamedplus'}           -- Copy paste between vim and everything else
vim.opt.autochdir      = true                      -- Your working directory will always be the same as your working directory
vim.opt.autoread       = true
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
-- vim.opt.lazyredraw     = true                      -- same as above
vim.opt.visualbell     = true
-- vim.opt.colorcolumn    = '100'
vim.opt.updatetime     = 100                       -- Faster completion
vim.opt.virtualedit    = 'block'
-- vim.opt fileencoding
vim.opt.fileencodings = 'utf-8,ucs-bom,gb18030,gbk,gb2312,cp936'
-- vim.opt.termencoding  = 'utf-8'
vim.opt.encoding      = 'utf-8'
-- vim.opt spell check identify en_us and cjk
vim.opt.spell         = false
vim.opt.spelllang     = { 'en' }
vim.o.compatible      = false

-- =======================================
-- 临时目录设置（backup / undo）
-- =======================================
local fn = vim.fn
local cache_tmp = fn.stdpath("cache") .. "/tmp"

fn.mkdir(cache_tmp .. "/backup", "p")
fn.mkdir(cache_tmp .. "/undo", "p")

vim.opt.backupdir = { cache_tmp .. "/backup", "." }
vim.opt.directory = { cache_tmp .. "/backup", "." }

if fn.has("persistent_undo") == 1 then
  vim.opt.undofile = true
  vim.opt.undodir = { cache_tmp .. "/undo", "." }
end

-- =======================================
-- 光标恢复
-- =======================================
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local row = fn.line([['"]])
    if row > 1 and row <= fn.line("$") then
      vim.cmd([[normal! g'"]])
    end
  end,
})

-- =======================================
-- 终端设置
-- =======================================
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  command = "startinsert",
})

vim.keymap.set("t", "<C-N>", [[<C-\><C-N>]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-O>", [[<C-\><C-N><C-O>]], { noremap = true, silent = true })

-- =======================================
-- 加载 machine_specific.lua
-- =======================================
local config_path = fn.stdpath("config")
local current_config_path = vim.fs.joinpath(config_path, "lua", "machine_specific.lua")
local default_config_path = vim.fs.joinpath(config_path, "lua", "config", "_machine_specific_default.lua")

if not vim.loop.fs_stat(current_config_path) then
  local default_config_file = io.open(default_config_path, "rb")
  if default_config_file then
    local content = default_config_file:read("*all")
    local current_config_file = io.open(current_config_path, "wb")
    if current_config_file then
      current_config_file:write(content)
      current_config_file:close()
    end
    default_config_file:close()
  end
end

require("machine_specific")
