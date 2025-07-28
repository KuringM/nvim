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
		trig = "fr",
		desc = "\frac",
		snippetType = "autosnippet",
		condition = in_math,
	}, fmta([[\frac{<>}{<>}]], { i(1), i(2) })),
	s({
		trig = "/",
		desc = "\frac",
		snippetType = "autosnippet",
		condition = in_math,
	}, fmta([[\frac{<>}{<>}]], { d(1, get_visual), i(2) })),
	s(
		{
			trig = [[([%d\\%a_^{}]+)/]],
			name = "symbol frac",
			desc = "Convert symbol/ to \\frac{symbol}{...}",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_math,
		},
		fmta([[\frac{<>}{<>}]], {
			f(function(_, snip)
				return snip.captures[1] or ""
			end, {}),
			i(1),
		})
	),
}
