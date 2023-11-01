local tan = '#f4c069'
local red       = '#fb4934'
local red_dark  = '#a80000'
local red_light = '#ff4090'
local orange       = '#fe8019'
local orange_light = '#f0af00'
local yellow = '#fabd2f'
local green_dark  = '#50de60'
local green       = '#98C379'
local green_light = '#a0ff70'
local blue     = '#83a598'
local cyan     = '#8ec07c'
local ice      = '#49a0f0'
local teal     = '#00d0c0'
local turqoise = '#2bff99'
local magenta      = '#d5508f'
local magenta_dark = '#bb0099'
local pink         = '#ffa6ff'
local pink_light   = '#ffb7b7'
local purple       = '#C678DD'
local purple_light = '#A8D5E2'
local magenta_light1 = '#BD93BD'
local magenta_light2 = '#A7A2A9'
local navyblue = '#6699CC'
local gray        = '#928374'
local gray_dark   = '#3c3836'
local gray_darker = '#242a32'
local gray_light  = '#c0c0c0'

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.md", command = "setlocal spell", })
-- H1~H6
vim.api.nvim_set_hl(0, "@text.title.1", { fg = red, bold = true})
vim.api.nvim_set_hl(0, '@text.title.2', { fg=orange, bold =true})
vim.api.nvim_set_hl(0, '@text.title.3', { fg=yellow, bold =true})
vim.api.nvim_set_hl(0, '@text.title.4', { fg=green_dark , bold =true})
vim.api.nvim_set_hl(0, '@text.title.5', { fg=cyan  , bold =true})
vim.api.nvim_set_hl(0, '@text.title.6', { fg=purple, bold =true})
-- vim.api.nvim_set_hl(0, '@text.title.6', { fg=purple_light, bold =true})
vim.api.nvim_set_hl(0, '@text.title.1.marker', {fg=orange})
vim.api.nvim_set_hl(0, '@text.title.2.marker', {fg=orange})
vim.api.nvim_set_hl(0, '@text.title.3.marker', {fg=orange})
vim.api.nvim_set_hl(0, '@text.title.4.marker', {fg=orange})
vim.api.nvim_set_hl(0, '@text.title.5.marker', {fg=orange})
vim.api.nvim_set_hl(0, '@text.title.6.marker', {fg=orange})

-- Italic, Bold, BoldItalic, Strike
vim.api.nvim_set_hl(0, '@text.emphasis', {fg=gray, italic= true})
vim.api.nvim_set_hl(0, '@text.strong', {fg=gray_light, bold= true})
-- vim.api.nvim_set_hl(0, {'@text.emphasis', '@text.strong',}, {fg=orange})
vim.api.nvim_set_hl(0, '@text.strike', {fg=red_dark, strikethrough= true})

-- Tex
vim.api.nvim_set_hl(0, '@text.environment', {fg=blue, bold=true})
vim.api.nvim_set_hl(0, '@function', {fg=gray, italic= true})
