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
local get_comment_format = helpers.get_comment_format
local make_box = helpers.make_box
local get_box_width = helpers.get_box_width

return {
	s({ trig = "todo", desc = "TODO comment", snippetType = "autosnippet" }, {
		f(function()
			return get_comment_format()[1] .. "TODO:"
		end, {}),
		i(1, "Something"),
		f(function()
			local date = os.date("%Y/%m/%d")
			local author = vim.g.snips_author or ""
			return string.format(" <%s%s>", date, author ~= "" and ", " .. author or "")
		end, {}),
		f(function()
			return get_comment_format()[3]
		end, {}),
	}),
	s({ trig = "c", desc = "A nice box with comment symbols", condition = line_begin }, {
		d(1, function(_, snip)
			local content = snip.env.SELECT_RAW or "content"
			local box = make_box(#content)
			return sn(nil, {
				t(box[1]),
				t({ "", box[2] }),
				i(1, content),
				t({ "", box[3] }),
			})
		end),
		i(0),
	}),
	s({ trig = "cc", desc = "Box over full width", condition = line_begin }, {
		d(1, function(_, snip)
			local content = snip.env.SELECT_RAW or "centered text"
			local width = get_box_width()
			local sline, mlines, mlinee, eline = make_box(content, width)
			return sn(nil, {
				t(sline),
				t({ "", mlines }),
				i(1, content),
				t(mlinee),
				t({ "", eline }),
			})
		end),
		i(0),
	}),
	s({ trig = "cs", desc = "Shorter width box (30)", condition = line_begin }, {
		d(1, function(_, snip)
			local content = snip.env.SELECT_RAW or "content"
			local width = math.max(get_box_width(), 30)
			local sline, mlines, mlinee, eline = make_box(#content, width)
			return sn(nil, {
				t(sline),
				t({ "", mlines }),
				i(1, content),
				t(mlinee),
				t({ "", eline }),
			})
		end),
		i(0),
	}),
}
