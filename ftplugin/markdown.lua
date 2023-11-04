local colors = require('colors')

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.md", command = "setlocal spell", })

local HGS ={
	-- H1~H6
	{ hg = "@text.title.1" , style = { fg = colors.red        , bold = true} } ,
	{ hg = '@text.title.2' , style = { fg = colors.orange     , bold = true} } ,
	{ hg = '@text.title.3' , style = { fg = colors.yellow     , bold = true} } ,
	{ hg = '@text.title.4' , style = { fg = colors.green_dark , bold = true} } ,
	{ hg = '@text.title.5' , style = { fg = colors.cyan       , bold = true} } ,
	{ hg = '@text.title.6' , style = { fg = colors.purple     , bold = true} } ,

	-- H1-H6's markers
	{ hg = '@text.title.1.marker' , style = { fg = colors.orange } } ,
	{ hg = '@text.title.2.marker' , style = { fg = colors.orange } } ,
	{ hg = '@text.title.3.marker' , style = { fg = colors.orange } } ,
	{ hg = '@text.title.4.marker' , style = { fg = colors.orange } } ,
	{ hg = '@text.title.5.marker' , style = { fg = colors.orange } } ,
	{ hg = '@text.title.6.marker' , style = { fg = colors.orange } } ,

	-- Italic, Bold, BoldItalic, Strike, LaTEX environment, LaTEX function
	{ hg = '@text.emphasis'    , style = { fg = colors.gray       , italic        = true                 } } ,
	{ hg = '@text.strong'      , style = { fg = colors.gray_light , bold          = true                 } } ,
	{ hg = '@text.strike'      , style = { fg = colors.red_dark   , strikethrough = true , italic = true } } ,
	{ hg = '@text.environment' , style = { fg = colors.gray       , bold          = true                 } } ,
	{ hg = '@function'         , style = { fg = colors.gray       , italic        = true                 } } ,
}

for _,HG in pairs(HGS) do
	vim.api.nvim_set_hl(0, HG.hg, HG.style)
end
