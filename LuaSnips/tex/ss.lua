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
	s(
		{
			trig = "(%a)(%d)",
			desc = "Auto subscript single digit",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_math,
		},
		f(function(_, snip)
			return snip.captures[1] .. "_" .. snip.captures[2]
		end, {})
	),

	s(
		{
			trig = "(%a)_(%d%d)",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_math,
			desc = "Auto subscript double digit",
		},
		f(function(_, snip)
			return snip.captures[1] .. "_{" .. snip.captures[2] .. "}"
		end, {})
	),

	s(
		{ trig = "__", desc = "manual subscript", wordTrig = false, snippetType = "autosnippet" },
		fmta([[_{<>}]], { i(1) })
	),

	s(
		{ trig = "sr", desc = "squared ^2", wordTrig = false, snippetType = "autosnippet", condition = in_math },
		t("^2")
	),

	s({ trig = "cu", desc = "cubed ^3", wordTrig = false, snippetType = "autosnippet", condition = in_math }, t("^3")),

	s(
		{ trig = "ss", desc = "superscript", wordTrig = false, snippetType = "autosnippet", condition = in_math },
		fmta([[^{<>}]], { i(1) })
	),

	s({
		trig = "sd",
		desc = "Derivative: y^{(n)}",
		wordTrig = false,
		snippetType = "autosnippet",
		condition = in_math,
	}, fmta([[^{(<>)}]], { i(1) })),

	s(
		{ trig = "sq", desc = "sqrt", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		fmta([[\sqrt{<>}]], { d(1, get_visual) })
	),

	s(
		{ trig = "st", desc = "nth root", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		fmta([[\sqrt[<>]{<>}]], { i(1), d(2, get_visual) })
	),
}
