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
local foreground            = '#f8f8f2'
local background            = '#282a36'
local selection_foreground  = '#ffffff'
local selection_background  = '#44475a'

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.md", command = "setlocal spell", })

local HGS ={
	-- H1~H6
	{ hg = "@text.title.1", style = { fg = red,         bold = true} },
	{ hg = '@text.title.2', style = { fg = orange,      bold = true} },
	{ hg = '@text.title.3', style = { fg = yellow,      bold = true} },
	{ hg = '@text.title.4', style = { fg = green_dark , bold = true} },
	{ hg = '@text.title.5', style = { fg = cyan  ,      bold = true} },
	{ hg = '@text.title.6', style = { fg = purple,      bold = true} },

	-- H1-H6's markers
	{ hg = '@text.title.1.marker', style = { fg = orange } },
	{ hg = '@text.title.2.marker', style = { fg = orange } },
	{ hg = '@text.title.3.marker', style = { fg = orange } },
	{ hg = '@text.title.4.marker', style = { fg = orange } },
	{ hg = '@text.title.5.marker', style = { fg = orange } },
	{ hg = '@text.title.6.marker', style = { fg = orange } },

	-- Italic, Bold, BoldItalic, Strike, LaTEX environment, LaTEX function
	{ hg = '@text.emphasis'    , style = { fg=gray, italic= true } },
	{ hg = '@text.strong'      , style = { fg=gray_light, bold= true } },
	{ hg = '@text.strike'      , style = { fg=red_dark, strikethrough= true, italic= true } },
	{ hg = '@text.environment' , style = { fg=gray, bold=true } },
	{ hg = '@function'         , style = { fg=gray, italic= true } },
}

for _,HG in pairs(HGS) do
	vim.api.nvim_set_hl(0, HG.hg, HG.style)
end
