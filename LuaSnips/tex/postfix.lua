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
			trig = [[vec([a-zA-Z0])]],
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "vector",
			condition = ou("vec", in_math),
		},
		fmta([[ \vec{<>} ]], {
			f(function(_, snip)
				return snip.captures[1]
			end, {}),
		})
	),

	s(
		{ trig = "hu", desc = "arc (overset frown)", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		fmta([[ \overset{\LARGE{\frown}}{<>} ]], { i(1) })
	),

	s(
		{ trig = "ub", desc = "\\underbrace", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		fmta([[ \underbrace{<>}_{<>} ]], { d(1, get_visual), i(2) })
	),

	s(
		{ trig = "subs", desc = "\\substack", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		fmta([[ \substack{<>} ]], { i(1) })
	),

	s({
		trig = "smo",
		desc = "\\mathop with limits",
		wordTrig = true,
		snippetType = "autosnippet",
		condition = in_math,
	}, fmta([[ \mathop{<>}\limits_{<>} ]], { i(1), i(2) })),

	s(
		{ trig = "bar", desc = "\\bar{}", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		fmta([[ \bar{<>} ]], { i(1) })
	),

	s(
		{ trig = "til", desc = "\\tilde{}", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		fmta([[ \tilde{<>} ]], { i(1) })
	),

	s(
		{ trig = "mr", desc = "\\mathring{U} (x_0)", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		fmta([[ \mathring{<>} (<>)]], { i(1, "U"), i(2, "x_0") })
	),

	s(
		{ trig = "os", desc = "\\overset", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		fmta([[ \overset{<>}{<>} ]], { i(1), i(2) })
	),

	s(
		{ trig = "us", desc = "\\underset", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		fmta([[ \underset{<>}{<>} ]], { i(1), i(2) })
	),
}
