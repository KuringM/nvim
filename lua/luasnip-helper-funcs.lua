local M = {}

local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node

function M.get_ISO_8601_date()
	return os.date("%Y-%m-%d")
end

function M.get_visual(args, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else
		return sn(nil, i(1, ""))
	end
end

M.in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
M.in_text = function()
	return not M.in_mathzone()
end

return M
