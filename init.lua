require("config.options")
require("config/keymaps")
require("config/autocmd")
require("lazynvim")
require("script.compile_run")
require("script.TurnMD2HTML")

vim.cmd([[:source $HOME/.config/nvim/lua/script/TurnCP2EP.vim]])
