-- 中文标点 → 英文标点映射表
local mark_map = {
	["。"] = ". ",
	["．"] = ". ",
	["，"] = ", ",
	["；"] = ";",
	["？"] = "?",
	["："] = ":",
	["‘"] = "'",
	["’"] = "'",
	["“"] = '"',
	["”"] = '"',
	["《"] = "<",
	["》"] = ">",
	["——"] = "-",
	["）"] = ")",
	["（"] = "(",
	["……"] = "^",
	["¥"] = "$",
	["！"] = "!",
	["·"] = "`",
	["【"] = "[",
	["】"] = "]",
	["｜"] = "|",
}

-- 替换整篇文本中的中文标点
local function replace_punctuation()
	local bufnr = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

	for linenr, line in ipairs(lines) do
		local changed = false
		for cn, en in pairs(mark_map) do
			if line:find(cn) then
				line = line:gsub(cn, en)
				changed = true
			end
		end
		if changed then
			vim.api.nvim_buf_set_lines(bufnr, linenr - 1, linenr, false, { line })
		end
	end
end

-- 注册快捷键 <C-s>
vim.keymap.set(
	"n",
	"<C-s>",
	replace_punctuation,
	{ desc = "Replace Chinese punctuation", noremap = true, silent = true }
)
vim.keymap.set("i", "<C-s>", function()
	vim.cmd("stopinsert")
	vim.schedule(replace_punctuation)
end, { desc = "Replace Chinese punctuation", noremap = true, silent = true })
