require('config.options')
require('config/keymaps')
require('config/autocmd')
require('plugin/lazynvim')
require("script.compile_run")

vim.cmd([[:source $HOME/.config/nvim/lua/script/TurnCP2EP.vim]])
