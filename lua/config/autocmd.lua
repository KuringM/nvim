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
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 100 }
  end,
})

-- autocmd shift keylayout
-- 设置默认英文输入法 ID
vim.g.default_input_method = "com.apple.keylayout.Colemak"

-- 保存上一次输入法(全局变量)
local last_input_method = vim.g.default_input_method

-- 离开插入模式时:记录当前输入法并切回英文
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    local current_ime = vim.fn.system("im-select"):gsub("%s+", "")
    last_input_method = current_ime
    vim.fn.system({ "im-select", vim.g.default_input_method })
  end,
})

-- 进入插入模式时:切回上次输入法
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    if last_input_method and last_input_method ~= "" then
      vim.fn.system({ "im-select", last_input_method })
    end
  end,
})
