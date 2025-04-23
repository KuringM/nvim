local colors = require("colors")
local G = require("G")

-- ban markdown markdown_recommended_style, like expandtab tabstop=4 softtabstop=4 shiftwidth=4!
vim.g.markdown_recommended_style = 0
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.md", command = "setlocal spell" })

G.hl({
	-- Treesitters syntax style rebuild
	{ "@markup.heading.1",    { fg = colors.red, bold = true } },
	{ "@markup.heading.2",    { fg = colors.orange, bold = true } },
	{ "@markup.heading.3",    { fg = colors.yellow, bold = true } },
	{ "@markup.heading.4",    { fg = colors.green_dark, bold = true } },
	{ "@markup.heading.5",    { fg = colors.cyan, bold = true } },
	{ "@markup.heading.6",    { fg = colors.purple, bold = true } },
	{ "@markup.emphasis",     { fg = colors.gray, italic = true } },
	{ "@markup.italic",       { fg = colors.gray, italic = true } },
	{ "@markup.strong",       { fg = colors.gray_light, bold = true } },
	{ "@markup.strike",       { fg = colors.red_dark, strikethrough = true, italic = true } },
	{ "@markup.environment",  { fg = colors.gray, bold = true } },
	{ "@function",            { fg = colors.gray, italic = true } },
	{ "@punctuation.special", { fg = colors.orange, italic = true } },

	-- markdowm.vim syntax style rebulid
	{ "texMathZoneTD"       , { fg = colors.yellow_light } } ,
	{ "texMathZoneTI"       , { fg = colors.yellow_light } } ,
	{ "mkdNonListItemBlock" , { fg = colors.yellow_light } } ,
	{ "texMathDelim"        , { fg = colors.red1 } }         ,
	{ "texDelim"            , { fg = colors.red1 } }         ,
	{ "texMathSymbol"       , { fg = colors.gray            , italic = true } } ,
	{ "texCmdGreek"         , { fg = colors.gray            , italic = true } } ,
	{ "texMathCmd"          , { fg = colors.gray } }        ,
	{ "texTabularChar"      , { fg = colors.gray            , italic = true } } ,
	{ "texMathStyleConcArg" , { fg = colors.gray            , italic = true } } ,
	{ "texEnvMArgName"      , { fg = colors.gray            , italic = true } } ,
	})

	-- vimtex support
vim.fn['vimtex#init']()
