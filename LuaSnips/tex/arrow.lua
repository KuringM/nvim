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

return {
	s(
		{ trig = "ora", desc = "overrightarrow", snippetType = "autosnippet" },
		fmta([[\overrightarrow<>]], { i(1) }),
		{ condition = in_math }
	),
	s(
		{ trig = "xra", desc = "xRightarrow", snippetType = "autosnippet" },
		fmta([[\xRightarrow<>]], { i(1) }),
		{ condition = in_math }
	),
	s(
		{ trig = "nra", desc = "nrightarrow", snippetType = "autosnippet" },
		t([[\nrightarrow]]),
		{ condition = in_math }
	),
	s(
		{ trig = "lra", desc = "overrightarrow", snippetType = "autosnippet" },
		t([[\leftrightarrow]]),
		{ condition = in_math }
	),
	s(
		{ trig = "xle", desc = "longequal{...}", snippetType = "autosnippet" },
		fmta([[\xlongequal<>]], { i(1) }),
		{ condition = in_math }
	),
}
