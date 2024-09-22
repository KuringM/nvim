require('options')
require('keymaps')
require('lazynvim')
require("scripts.compile_run")
-- require("plugin.TurnCP2EP")
-- require("plugin.vertical_cursor_movement")

-- local swap_ternary = require("plugin.swap_ternary")
-- vim.keymap.set("n", "<leader>st", swap_ternary.swap_ternary, { noremap = true })
--
vim.cmd([[:source $HOME/.config/nvim/lua/scripts/TurnCP2EP.vim]])
