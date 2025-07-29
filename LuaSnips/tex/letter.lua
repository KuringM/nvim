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
		trig = "alp",
		desc = "alpha",
		wordTrig = false,
		snippetType = "autosnippet",
		condition = ou("alp", in_math),
	}, t("\\alpha")),
	s(
		{ trig = "bet", desc = "beta", wordTrig = false, snippetType = "autosnippet", condition = ou("bet", in_math) },
		t("\\beta")
	),
	s(
		{
			trig = "ga",
			desc = "gamma: γ",
			wordTrig = false,
			snippetType = "autosnippet",
			condition = ou("ga", in_math),
		},
		t("\\gamma")
	),
	s(
		{
			trig = "Ga",
			desc = "Gamma: Γ",
			wordTrig = false,
			snippetType = "autosnippet",
			condition = ou("Ga", in_math),
		},
		t("\\Gamma")
	),
	s(
		{ trig = "lam", desc = "lambda", wordTrig = false, snippetType = "autosnippet", condition = ou("lam", in_math) },
		t("\\lambda")
	),
	s(
		{ trig = "Lam", desc = "Lambda", wordTrig = false, snippetType = "autosnippet", condition = ou("Lam", in_math) },
		t("\\Lambda")
	),
	s(
		{ trig = "ep", desc = "epsilon", wordTrig = false, snippetType = "autosnippet", condition = ou("ep", in_math) },
		t("\\epsilon")
	),
	s({
		trig = "vep",
		desc = "varepsilon",
		wordTrig = false,
		snippetType = "autosnippet",
		condition = ou("vep", in_math),
	}, t("\\varepsilon")),
	s(
		{ trig = "vp", desc = "varphi", wordTrig = false, snippetType = "autosnippet", condition = ou("vp", in_math) },
		t("\\varphi")
	),
	s(
		{ trig = "de", desc = "delta", wordTrig = false, snippetType = "autosnippet", condition = ou("de", in_math) },
		t("\\delta")
	),
	s(
		{ trig = "De", desc = "Delta", wordTrig = false, snippetType = "autosnippet", condition = ou("De", in_math) },
		t("\\Delta")
	),
	s(
		{ trig = "vde", desc = "delta", wordTrig = false, snippetType = "autosnippet", condition = ou("vde", in_math) },
		t("\\delta")
	),
	s(
		{ trig = "ome", desc = "omega", wordTrig = false, snippetType = "autosnippet", condition = ou("ome", in_math) },
		t("\\omega")
	),
	s(
		{ trig = "Ome", desc = "Omega", wordTrig = false, snippetType = "autosnippet", condition = ou("Ome", in_math) },
		t("\\Omega")
	),
	s({
		trig = "sig",
		desc = "sigma: σ",
		wordTrig = false,
		snippetType = "autosnippet",
		condition = ou("sig", in_math),
	}, t("\\sigma")),
	s({
		trig = "Sig",
		desc = "Sigma: Σ",
		wordTrig = false,
		snippetType = "autosnippet",
		condition = ou("Sig", in_math),
	}, t("\\Sigma")),
	s(
		{ trig = "nab", desc = "nabla", wordTrig = false, snippetType = "autosnippet", condition = ou("nab", in_math) },
		t("\\nabla")
	),
	s(
		{ trig = "the", desc = "theta", wordTrig = false, snippetType = "autosnippet", condition = ou("the", in_math) },
		t("\\theta")
	),
	s(
		{ trig = "re", desc = "Reals", wordTrig = false, snippetType = "autosnippet", condition = ou("re", in_math) },
		t("\\Reals")
	),
	s(
		{ trig = "inf", desc = "infty", wordTrig = false, snippetType = "autosnippet", condition = ou("inf", in_math) },
		t("\\infty")
	),
	s(
		{ trig = "deg", desc = "degree", wordTrig = false, snippetType = "autosnippet", condition = ou("deg", in_math) },
		t("\\degree")
	),
	s({ trig = "lim", desc = "lim", wordTrig = false, condition = ou("lim", in_math) }, t("\\lim")),
	s(
		{
			trig = "par",
			desc = "partial",
			wordTrig = false,
			snippetType = "autosnippet",
			condition = ou("par", in_math),
		},
		t("\\partial")
	),
	s(
		{ trig = "psi", desc = "psi", wordTrig = false, snippetType = "autosnippet", condition = ou("psi", in_math) },
		t("\\psi")
	),
	s(
		{ trig = "rho", desc = "rho", wordTrig = false, snippetType = "autosnippet", condition = ou("rho", in_math) },
		t("\\rho")
	),
	s(
		{ trig = "tau", desc = "tau", wordTrig = false, snippetType = "autosnippet", condition = ou("tau", in_math) },
		t("\\tau")
	),
	s(
		{ trig = "xi", desc = "xi", wordTrig = false, snippetType = "autosnippet", condition = ou("xi", in_math) },
		t("\\xi")
	),
	s(
		{ trig = "eta", desc = "eta", wordTrig = false, snippetType = "autosnippet", condition = ou("eta", in_math) },
		t("\\eta")
	),
	s(
		{ trig = "zeta", desc = "zeta", wordTrig = false, snippetType = "autosnippet", condition = ou("zeta", in_math) },
		t("\\zeta")
	),
	s(
		{ trig = "pi", desc = "pi", wordTrig = false, snippetType = "autosnippet", condition = ou("pi", in_math) },
		t("\\pi")
	),
	s(
		{ trig = "Pi", desc = "Pi", wordTrig = false, snippetType = "autosnippet", condition = ou("Pi", in_math) },
		t("\\Pi")
	),
}
