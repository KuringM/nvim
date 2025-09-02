-- Auto change directory to current dir
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = "lcd %:p:h" })

-- 设置 autocmd 以识别 JSON 文件并将其视为 JSONC
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.json" },
	command = "set filetype=jsonc",
})

-- highlighting a selection on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
	end,
})

-- autocmd shift keylayout
-- 默认英文输入法 (这里用 Colemak)
vim.g.default_input_method = "com.apple.keylayout.Colemak"

-- 保存上一次输入法
vim.g.last_input_method = vim.g.default_input_method

-- 获取当前输入法
local function get_current_ime()
	local ime = vim.fn.systemlist("im-select")[1]
	return ime or vim.g.default_input_method
end

-- 设置输入法
local function set_ime(ime)
	if ime and ime ~= "" then
		vim.fn.system({ "im-select", ime })
	end
end

-- 离开插入模式时: 记录并切回英文
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		local current_ime = get_current_ime()
		vim.g.last_input_method = current_ime
		if current_ime ~= vim.g.default_input_method then
			set_ime(vim.g.default_input_method)
		end
	end,
})

-- -- 进入插入模式时: 切回上次输入法
-- vim.api.nvim_create_autocmd("InsertEnter", {
-- 	callback = function()
-- 		if vim.g.last_input_method and vim.g.last_input_method ~= "" then
-- 			set_ime(vim.g.last_input_method)
-- 		end
-- 	end,
-- })

-- 当回到 Neovim、光标停留或缓冲区进入时检查文件变化
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "FocusGained" }, {
	pattern = "*",
	callback = function()
		vim.cmd("checktime") -- 检测文件是否被外部修改
	end,
})

-- 文件被重新读取后刷新语法高亮
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		-- 普通语法高亮刷新
		vim.cmd("syntax sync fromstart")
		-- Tree-sitter 高亮刷新（如果启用 Tree-sitter）
		local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
		if ok then
			vim.cmd("TSBufEnable highlight")
		end
	end,
})

-- 可选：当文件外部修改并自动加载时显示提示
vim.api.nvim_create_autocmd("FileChangedShellPost", {
	pattern = "*",
	callback = function()
		print("⚡ 文件已被外部修改并重新加载")
	end,
})
