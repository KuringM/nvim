-- Auto change directory to current dir
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = "lcd %:p:h" })

-- 设置 autocmd 以识别 JSON 文件并将其视为 JSONC
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.json" },
	command = "set filetype=jsonc",
})

-- highlighting a selection on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end,
})
