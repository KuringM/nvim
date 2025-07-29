local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local m = require("luasnip.extras").m
local l = require("luasnip.extras").l
local postfix = require("luasnip.extras.postfix").postfix
local conds_expand = require("luasnip.extras.conditions.expand")
local line_begin = conds_expand.line_begin
local line_end = conds_expand.line_end

local helpers = require("luasnip-helper-funcs")
local get_visual = helpers.get_visual
local in_text = helpers.in_text
local in_math = helpers.in_mathzone
local ou = helpers.only_unescaped

-- 创建一个函数用于根据捕获值生成 snippet
local function create_snippet(func_name)
	return s({
		trig = func_name,
		regTrig = true,
		wordTrig = false,
		snippetType = "autosnippet",
		condition = ou(func_name, in_math),
	}, t("\\" .. func_name))
end

-- 生成多个 snippet
local function_names = {
	"sin",
	"cos",
	"tan",
	"arctan",
	"arccot",
	"cot",
	"sec",
	"csc",
	"ln",
	"log",
	"exp",
	"star",
	"perp",
	"cdot",
	"cdots",
	"times",
	"cap",
	"cup",
	"circ",
	"quad",
	"qquad",
	"sim",
	"div",
}

local snippets = {
	s(
		{
			trig = "([2-3])?int(%S+)? ?(%S+)?",
			regTrig = true,
			wordTrig = true,
			snippetType = "autosnippet",
			condition = in_math,
		},
		fmta(
			[[
    \<> <> f(<>) \mathrm{d}<>
    ]],
			{
				f(function(_, snip)
					local lvl = snip.captures[1]
					local sub = snip.captures[2]
					local sup = snip.captures[3]
					local name, lim
					if lvl then
						name = string.rep("i", tonumber(lvl) - 1) .. "int"
						lim = sub and ("\\limits_{" .. sub .. "}") or ""
					else
						name = "int"
						lim = sub and ("_{" .. sub .. "}") or ""
					end
					local upp = sup and ("^{" .. sup .. "}") or ""
					return name .. lim .. upp
				end, {}),
				t(" "),
				f(function(_, snip)
					local lvl = snip.captures[1]
					if lvl == "2" then
						return "x,y"
					elseif lvl == "3" then
						return "x,y,z"
					else
						return "x"
					end
				end, {}),
				f(function(_, snip)
					local lvl = snip.captures[1]
					if lvl == "2" then
						return "\\sigma"
					elseif lvl == "3" then
						return "v"
					else
						return "x"
					end
				end, {}),
			}
		)
	),
	s({
		trig = "summ",
		desc = "\\sum with limits",
		wordTrig = true,
		snippetType = "autosnippet",
		condition = in_math,
	}, fmta([[\sum\limits_{<>}^{<>}]], { i(1), i(2) })),

	s({
		trig = "prodd",
		desc = "\\prod with limits",
		wordTrig = true,
		snippetType = "autosnippet",
		condition = in_math,
	}, fmta([[\prod\limits_{<>}^{<>}]], { i(1), i(2) })),

	s({
		trig = "ip",
		desc = "inner product",
		wordTrig = true,
		snippetType = "autosnippet",
		condition = in_math,
	}, fmt([[\big< {} \big>]], { i(1) })),

	s({
		trig = "limm",
		desc = "\\lim\\limis",
		wordTrig = true,
		snippetType = "autosnippet",
		condition = in_math,
	}, fmta([[\lim\limits_{<> \to <>} <>]], { i(1, "x"), i(2, "x_0"), i(3, "f(x)") })),

	s({
		trig = "lims",
		desc = "limit with \\substack",
		wordTrig = true,
		snippetType = "autosnippet",
		condition = in_math,
	}, fmta([[\lim_{\substack{<>}}]], { i(1) })),

	s({
		trig = "bu",
		desc = "\\bullet",
		wordTrig = true,
		snippetType = "autosnippet",
		condition = in_math,
	}, t("\\bullet")),

	s({
		trig = "mod",
		desc = "norm/module with | |",
		wordTrig = true,
		snippetType = "autosnippet",
		condition = in_math,
	}, fmta([[\left| <> \right|]], { i(1) })),

	s(
		{
			trig = "oiint",
			desc = "Obsidian-style double contour integral",
			wordTrig = true,
			snippetType = "autosnippet",
			condition = in_math,
		},
		fmta(
			[[ \underset{ <> \;}{ {\rlap{\mspace{1mu} \boldsymbol{\bigcirc}}{\rlap{\int}{\;\int}}} } ]],
			{ i(1, "\\Sigma") }
		)
	),
}

for _, name in ipairs(function_names) do
	table.insert(snippets, create_snippet(name))
end

return snippets
