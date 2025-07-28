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


return {
	s(
		{ trig = "^h([1-6])", regTrig = true, wordTrig = false, snippetType="autosnippet", name = "Markdown heading" },
		{
			-- match.captures[1] → "1"~"6", 转为 "#" * n
			f(function(_, snip)
				local n = tonumber(snip.captures[1]) or 1
				return string.rep("#", n) .. " "
			end, {}),
			i(1, "", { key = "VISUAL" }),
		}
	),
}
