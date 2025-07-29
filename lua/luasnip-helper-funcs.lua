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

-- ou = "only unescaped"
function M.only_unescaped(trig, extra_condition)
	return function(line_to_cursor, matched_trigger, _)
		local before = line_to_cursor:sub(1, #line_to_cursor - #trig)
		local unescaped = not before:match("\\$")
		if extra_condition then
			return unescaped and extra_condition()
		else
			return unescaped
		end
	end
end

-- Fallback unpack for LuaJIT
local unpack = table.unpack or unpack

--- Parses commentstring
local function _parse_commentstring(cs)
	if cs and cs:sub(-2) == "%s" then
		local c = cs:sub(1, -3):gsub("%s+$", "")
		return c, c, c, ""
	end
	return nil
end

-- Minimal parser for 'comments' option
local function _parse_comments(comments)
	local result = {}
	for entry in comments:gmatch("[^,]+") do
		local mode, rest = entry:match("^(%a):(.+)$")
		if mode and rest then
			local prefix, suffix = rest:match("^(.-)%(?)%%s%)?(.-)$")
			if prefix then
				table.insert(result, {
					mode == "s" and "SINGLE_CHAR" or "OTHER",
					{ prefix, prefix, suffix or "", "" },
				})
			end
		end
	end
	return result
end

-- Public API
M.get_comment_format = function()
	local cs = vim.bo.commentstring
	local c1, c2, c3, c4 = _parse_commentstring(cs)
	if c1 then
		return { c1, c2, c3, c4 }
	end

	local comments = _parse_comments(vim.bo.comments or "")
	for _, c in ipairs(comments) do
		if c[1] == "SINGLE_CHAR" then
			return c[2]
		end
	end
	return comments[1] and comments[1][2] or { "", "", "", "" }
end

M.make_box = function(content, bwidth)
	if type(content) == "table" then
		content = table.concat(content, " ")
	end

	-- 内容实际宽度(兼容中文和特殊字符)
	local content_len = vim.fn.strdisplaywidth(content)

	-- 获取注释符号
	local b, m, e, i = unpack(M.get_comment_format())
	b, m, e, i = b:match("^%s*(.-)%s*$"), m:match("^%s*(.-)%s*$"), e:match("^%s*(.-)%s*$"), i:match("^%s*(.-)%s*$")

	local m0 = m ~= "" and m:sub(1, 1) or "-" -- 默认用 "-" 填充边框

	-- 内部宽度:边框 - 前缀后缀(b, i, e)
	local padding = 2 -- 左右各一空格
	local inner = bwidth and (bwidth - #b - #e - #i - padding - 2) or (content_len + 4)
	local total_len = inner + #b + #e + #i + padding + 2

	-- 头尾线
	local sline = b .. m .. string.rep(m0, inner + padding) .. m
	local eline = i .. m .. string.rep(m0, inner + padding) .. m .. e

	-- 左右填充
	local space = inner - content_len
	local pad_left = math.floor(space / 2)
	local pad_right = space - pad_left

	-- 中间内容行
	local mlines = i .. m .. " " .. string.rep(" ", pad_left) .. content .. string.rep(" ", pad_right) .. " " .. m

	return sline, mlines, mlines, eline
end

M.get_box_width = function()
	local col = vim.fn.virtcol(".")
	local tw = vim.bo.textwidth
	if tw == 0 then
		tw = 71
	end
	return math.max(tw - ((col == 1) and 0 or col), 30)
end

return M
