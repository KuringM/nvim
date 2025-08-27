local modules = {
	"config.options",
	"config.keymaps",
	"config.autocmd",
	"lazynvim",
	"rime_ls",
	"script.compile_run",
	"script.sortABC",
	"script.TurnCP2EP",
}

for _, mod in ipairs(modules) do
	local ok, m = pcall(require, mod)
	if not ok then
		vim.notify("加载模块失败: " .. mod .. "\n错误: " .. tostring(m), vim.log.levels.ERROR)
	end
end
