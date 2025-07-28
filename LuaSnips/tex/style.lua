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
		{ trig = "tc", desc = "color text", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		fmta([[\textcolor{<>}{<>}]], { i(2, "red"), i(1) })
	),
	s(
		{ trig = "cbo", desc = "colorbox text", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		fmta([[\colorbox{#FEFDD3}{\textcolor{black}{$ <> $}}]], { d(1, get_visual) })
	),
	s(
		{ trig = "te", desc = "text in math", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		fmta([[\text{<>}]], { i(1) })
	),
	s(
		{ trig = "tbf", desc = "bold text", wordTrig = true, snippetType = "autosnippet" },
		fmta([[\textbf{<>}]], { i(1) })
	),
	s(
		{ trig = "pb", desc = "poor man's bold", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		fmta([[\pmb{<>}]], { i(1) })
	),
	s(
		{
			trig = "mm(%a)",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = ou("mm", in_math),
		},
		fmta([[\mathrm{<>}]], {
			f(function(_, snip)
				return snip.captures[1]
			end),
		})
	),
	s(
		{ trig = "mb", desc = "mathbb", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		fmta([[\mathbb{<>}]], { i(1) })
	),
	s(
		{ trig = "mop", desc = "mathop", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		fmta([[\mathop{<>}]], { i(1) })
	),
	s(
		{ trig = "ds", desc = "displaystyle", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t([[\displaystyle]])
	),
	s(
		{ trig = "ens", desc = "enspace", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t([[\enspace]])
	),
	s(
		{ trig = "lr", desc = "\\left...\\right", wordTrig = true,  condition = in_math },
		fmta([[\left <> \right]], { i(1) })
	),
	s(
		{ trig = "lrp", desc = "left()", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		fmta([[\left( <> \right)]], { i(1) })
	),
	s(
		{ trig = "lrb", desc = "left[]", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		fmta([[\left[ <> \right] ]], { i(1) })
	),
	s(
		{ trig = "lrh", desc = "left{}", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		fmta([[\left{ <> \right}]], { i(1) })
	),
}
