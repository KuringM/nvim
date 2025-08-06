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
		{ trig = "fa", desc = "forall: ∀", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\forall ")
	),
	s(
		{ trig = "ex", desc = "exists: ∃", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\exists ")
	),
	s({ trig = "in ", desc = "in: ∈", wordTrig = true, snippetType = "autosnippet", condition = in_math }, t("\\in ")),
	s(
		{ trig = "ni", desc = "notin: ∉", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\notin ")
	),
	s(
		{ trig = "sbs", desc = "subset: ⊂", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\subset ")
	),
	s(
		{ trig = "sbe", desc = "subseteq: ⊆", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\subseteq ")
	),
	s(
		{ trig = "sps", desc = "supset: ⊃", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\supset ")
	),
	s(
		{ trig = "mid", desc = "mid: |", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\mid ")
	),
	s(
		{ trig = "land", desc = "land: ∧", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\land ")
	),
	s(
		{ trig = "lor", desc = "lor: ∨", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\lor ")
	),
	s(
		{ trig = "neg", desc = "neg: ¬", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\neg ")
	),
	s(
		{ trig = "bec", desc = "because: ∵", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\because ")
	),
	s(
		{ trig = "thf", desc = "therefore: ∴", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\therefore ")
	),
	s(
		{ trig = "mto", desc = "mapsto: ↦", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\mapsto ")
	),
	s({ trig = "to", desc = "to: →", wordTrig = true, snippetType = "autosnippet", condition = in_math }, t("\\to ")),
	s(
		{ trig = "im", desc = "implies: ⟹", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\implies ")
	),
	s(
		{ trig = "id", desc = "impliedby: ⟸", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\impliedby ")
	),
	s(
		{ trig = "iff", desc = "iff: ⟺", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\iff ")
	),
	s(
		{ trig = "equ", desc = "equiv: ≡", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\equiv ")
	),
	s(
		{ trig = "ap", desc = "approx: ≈", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\approx ")
	),
	s(
		{ trig = "bs", desc = "backsim: ∽", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\backsim ")
	),
	s(
		{ trig = "gs", desc = "geqslant: ⩾", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\geqslant ")
	),
	s(
		{ trig = "ls", desc = "leqslant: ⩽", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\leqslant ")
	),
	s(
		{ trig = "perp", desc = "perp: ⊥", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\perp ")
	),
	s({ trig = "not", desc = "not", wordTrig = true, snippetType = "autosnippet", condition = in_math }, t("\\not ")),
	s(
		{ trig = "neq", desc = "not equal: ≠", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\neq ")
	),
	s(
		{ trig = "pm ", desc = "plus-minus: ±", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\pm ")
	),
	s(
		{ trig = "mp", desc = "minus-plus: ∓", wordTrig = true, snippetType = "autosnippet", condition = in_math },
		t("\\mp ")
	),
}
