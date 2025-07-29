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
		{ trig = "fu", desc = "Function f(x)", wordTrig = false, snippetType = "autosnippet" },
		fmta([[ <> ( <>) ]], { i(1, "f"), i(2, "x") })
	),

	s(
		{ trig = "der", desc = "Derivative f'(x)", wordTrig = false, snippetType = "autosnippet" },
		fmta([[ <>'( <>) ]], { i(1, "f"), i(2, "x") })
	),

	s(
		{ trig = "sn", desc = "sequence {x_n}", wordTrig = false, snippetType = "autosnippet" },
		fmta([[ \{ <>_n \} ]], { i(1, "x") })
	),

	s({ trig = "jx", desc = "0 < |x - x₀| < δ", wordTrig = false }, t([[ 0 < \mid x - x_0 \mid < \delta ]])),

	s(
		{ trig = "jx1", desc = "|xₙ - a| < ε", wordTrig = false, snippetType = "autosnippet" },
		t([[ \mid x_n - a \mid < \varepsilon ]])
	),

	s(
		{ trig = "jx2", desc = "|f(x) - A| < ε", wordTrig = false, snippetType = "autosnippet" },
		fmt([[ \mid f(x) - {} \mid < {} ]], { i(1, "A"), i(2, "\\varepsilon") })
	),

	s({ trig = "set", desc = "set {}", wordTrig = false, snippetType = "autosnippet" }, fmta([[ \{ <> \} ]], { i(1) })),
}
