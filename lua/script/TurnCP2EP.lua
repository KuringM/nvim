-- 中文标点 → 英文标点映射表
local mark_map = {
	["。"] = ". ",
	["．"] = ". ",
	["，"] = ", ",
	["；"] = ";",
	["？"] = "?",
	["："] = ": ",
	["‘"] = "'",
	["’"] = "'",
	["“"] = '"',
	["”"] = '"',
	["《"] = "<",
	["》"] = ">",
	["——"] = " -- ",
	["—"] = "-",
	["•"] = "-",
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

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.md",
	callback = function(args)
		local buf = args.buf or vim.api.nvim_get_current_buf()
		local filename = vim.api.nvim_buf_get_name(buf)

		-- 先执行 replace_punctuation
		if not filename:find("TurnCP2EP.lua") and vim.fn.mode():match("^n") then
			if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].modifiable then
				vim.api.nvim_buf_call(buf, replace_punctuation)
			end
		end

		-- 再执行 Unicode NFKC 归一化
		local pos = vim.api.nvim_win_get_cursor(0)
		vim.cmd(
			"%!python3 -c \"import sys,unicodedata;print(unicodedata.normalize('NFKC', sys.stdin.read()), end='')\""
		)
		pcall(vim.api.nvim_win_set_cursor, 0, pos)
	end,
})
