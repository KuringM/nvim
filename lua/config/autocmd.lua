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

-- 当回到 Neovim、光标停留或缓冲区进入时检查文件变化
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "FocusGained" }, {
	pattern = "*",
	callback = function()
		vim.cmd("checktime") -- 检测文件是否被外部修改
	end,
})

-- 文件被重新读取后刷新语法高亮
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*.md", -- 只对 markdown 生效
	callback = function()
		-- 重新加载 markdown syntax
		vim.cmd("runtime! syntax/markdown.vim")
		-- Tree-sitter 高亮刷新
		local ok, _ = pcall(require, "nvim-treesitter.configs")
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
