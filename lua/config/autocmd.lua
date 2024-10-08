-- Auto change directory to current dir
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = "lcd %:p:h", })

-- 设置 autocmd 以识别 JSON 文件并将其视为 JSONC
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.json"},
    command = "set filetype=jsonc"
})
