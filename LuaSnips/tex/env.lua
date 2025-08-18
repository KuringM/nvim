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
	s({ trig = "nl", desc = "newline", snippetType = "autosnippet" }, t([[\newline]])),
	s({
		trig = "tag",
		desc = "tag",
		wordTrig = true,
		snippetType = "autosnippet",
		condition = ou("tag", in_math),
	}, fmta([[\tag{<>}]], { i(1) })),
	s(
		{
			trig = "eqn",
			desc = "begin{equation}",
			snippetType = "autosnippet",
			condition = line_begin * in_math,
		},
		fmta(
			[[
				\begin{equation}
					\begin{split}
						<>
						&= <>
					\end{split}
				\end{equation}
			]],
			{ d(1, get_visual), i(2) }
		)
	),
	s(
		{
			trig = "al",
			desc = "Align with a number",
			condition = line_begin * in_math,
		},
		fmta(
			[[
				\begin{align}
					<>
				\end{align}
			]],
			{ d(1, get_visual) }
		)
	),
	s(
		{
			trig = "aln",
			desc = "Align without a number",
			condition = line_begin * in_math,
		},
		fmta(
			[[
				\begin{align*}
					<>
				\end{align*}
			]],
			{ d(1, get_visual) }
		)
	),
	s(
		{
			trig = "ald",
			desc = "Align in Embed",
			snippetType = "autosnippet",
			condition = line_begin * in_math,
		},
		fmta(
			[[
				\begin{aligned}
					<>
				\end{aligned}
			]],
			{ d(1, get_visual) }
		)
	),
	s(
		{
			trig = "ca",
			desc = "begin{cases}",
			snippetType = "autosnippet",
			condition = in_math,
		},
		fmta(
			[[
				\begin{cases}
					<>
				\end{cases}
			]],
			{ d(1, get_visual) }
		)
	),
	s(
		{
			trig = "rca",
			desc = "begin{rcases}",
			snippetType = "autosnippet",
			condition = in_math,
		},
		fmta(
			[[
				\begin{rcases}
					<>
				\end{rcases}
			]],
			{ d(1, get_visual) }
		)
	),
	s(
		{
			trig = "mtx",
			desc = "begin{*matrix}",
			snippetType = "autosnippet",
			condition = line_begin * in_math,
		},
		fmta(
			[[
				\begin{<>}
					<>
				\end{<>}
			]],
			{
				c(1, {
					t("matrix"),
					t("pmatrix"),
					t("bmatrix"),
					t("vmatrix"),
				}),
				d(2, get_visual),
				rep(1),
			}
		)
	),
}
