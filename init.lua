require('config.options')
require('config/keymaps')
require('plugin/lazynvim')
require("script.compile_run")
-- require("plugin.TurnCP2EP")
-- require("plugin.vertical_cursor_movement")

-- local swap_ternary = require("plugin.swap_ternary")
-- vim.keymap.set("n", "<leader>st", swap_ternary.swap_ternary, { noremap = true })
--
vim.cmd([[:source $HOME/.config/nvim/lua/script/TurnCP2EP.vim]])
