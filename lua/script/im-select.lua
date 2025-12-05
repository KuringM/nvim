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

-- 记录上一次按键的时间
local last_press = 0

-- 切换到中文输入法
local function switch_to_cn()
	vim.fn.system("im-select com.apple.inputmethod.SCIM.ITABC")
end

-- 插入模式下绑定 nei -> 切换中文
-- vim.keymap.set("i", "nei", function()
-- 	local now = vim.loop.hrtime() / 1e6 -- 毫秒
-- 	if now - last_press < 300 then -- 300ms 内算连击
-- 		switch_to_cn()
-- 		return "" -- 不插入 jk
-- 	else
-- 		last_press = now
-- 		return "nei" -- 正常输入 jk
-- 	end
-- end, { expr = true, desc = "快速 nei → 切换中文输入法" })

-- 切换到中文
vim.keymap.set("i", "nei", function()
	vim.fn.system("im-select com.apple.inputmethod.SCIM.ITABC")
end, { desc = "切换到中文输入法" })
