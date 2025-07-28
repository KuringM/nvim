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

local helpers = require("luasnip-helper-funcs")
local get_visual = helpers.get_visual

local conds_expand = require("luasnip.extras.conditions.expand")
local line_begin = conds_expand.line_begin

return {
	s(
		{ trig = "^h([1-6])", regTrig = true, wordTrig = false, snippetType = "autosnippet", name = "Markdown heading" },
		{
			f(function(_, snip)
				local n = tonumber(snip.captures[1]) or 1
				return string.rep("#", n) .. " "
			end, {}),
			d(1, get_visual),
		}
	),
	s(
		{ trig = "link", wordTrig = true, snippetType = "autosnippet", desc = "Link to something" },
		fmta([[[<>](<>)]], { i(1), d(2, get_visual) })
	),
	s(
		{ trig = "img", wordTrig = true, snippetType = "autosnippet", desc = "Image" },
		fmta([[![<>](<>)]], { i(1), d(2, get_visual) })
	),
	s(
		{ trig = "ci", wordTrig = false, snippetType = "autosnippet", desc = "Inline code" },
		fmta([[`<>`]], { d(1, get_visual) })
	),
	s(
		{ trig = "cb", snippetType = "autosnippet", desc = "CodeBlock" },
		fmta(
			[[
				```<>
				<>
				```
			]],
			{ i(1), d(2, get_visual) }
		),
		{ condition = line_begin }
	),
	s({ trig = "it", desc = "italics" }, fmt([[<i>{}</i>]], { d(1, get_visual) })),
	s({ trig = "bo", desc = "bold" }, fmt([[<b>{}</b>]], { d(1, get_visual) })),
	s({ trig = "bi", desc = "bold italics" }, fmt([[<b><i>{}</i></b>]], { d(1, get_visual) })),
	s({ trig = "st", desc = "strikethrough" }, fmt([[<s>{}</s>]], { d(1, get_visual) })),
	s({ trig = "ul", desc = "underline" }, fmt([[<u>{}</u>]], { d(1, get_visual) })),
	s({ trig = "task", desc = "task" }, fmt([[- [{}] ]], { d(1, get_visual) })),
	s({ trig = "ct", desc = "Comment" }, fmt([[<!-- {} -->]], { d(1, get_visual) })),
	s(
		{ trig = "cs", desc = "A collapsible section containing markdown" },
		fmt(
			[[
				<details>
					<summary>{}</summary>
					{}
				</details>
			]],
			{ d(1, get_visual), i(2) }
		),
		{ condition = line_begin }
	),
	s({ trig = "fc", desc = "font color" }, fmt([[<font color={}>{}</font>]], { i(1, "red"), d(2, get_visual) })),
}
