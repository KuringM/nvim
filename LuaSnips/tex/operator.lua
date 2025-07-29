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

return {
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
