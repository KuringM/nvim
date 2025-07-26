local colors = require("colors")
local G = require("G")

-- ban markdown markdown_recommended_style, like expandtab tabstop=4 softtabstop=4 shiftwidth=4!
vim.g.markdown_recommended_style = 0
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.md", command = "setlocal spell" })

G.hl({
	-- markdowm.vim syntax style rebulid
	{ "markdownH1"          , { fg = colors.red              , bold = true } }   ,
	{ "markdownH2"          , { fg = colors.orange           , bold = true } }   ,
	{ "markdownH3"          , { fg = colors.blue             , bold = true } }   ,
	{ "markdownH4"          , { fg = colors.green_dark       , bold = true } }   ,
	{ "markdownH5"          , { fg = colors.red              , bold = true } }   ,
	{ "markdownH6"          , { fg = colors.purple           , bold = true } }   ,
	{ "texMathZoneTD"       , { fg = colors.yellow_light } } ,
	{ "texMathZoneTI"       , { fg = colors.yellow_light } } ,
	{ "mkdNonListItemBlock" , { fg = colors.yellow_light } } ,
	{ "texMathDelim"        , { fg = colors.red1 } }         ,
	{ "texDelim"            , { fg = colors.red1 } }         ,
	{ "texMathSymbol"       , { fg = colors.gray             , italic = true } } ,
	{ "texCmdGreek"         , { fg = colors.gray             , italic = true } } ,
	{ "texMathCmd"          , { fg = colors.gray } }         ,
	{ "texTabularChar"      , { fg = colors.gray             , italic = true } } ,
	{ "texMathStyleConcArg" , { fg = colors.gray             , italic = true } } ,
	{ "texEnvMArgName"      , { fg = colors.gray             , italic = true } } ,
	})
