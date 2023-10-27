-- use lazy.nvim to manage nvim plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local lazy_cmd = require("lazy.view.config").commands
local lazy_keys = {
	{ cmd = "install", key = "i" },
	{ cmd = "update",  key = "u" },
	{ cmd = "sync",    key = "s" },
	{ cmd = "clean",   key = "cl" },
	{ cmd = "check",   key = "ch" },
	{ cmd = "log",     key = "l" },
	{ cmd = "restore", key = "rs" },
	{ cmd = "profile", key = "p" },
	{ cmd = "profile", key = "p" },
}
for _, v in ipairs(lazy_keys) do
	lazy_cmd[v.cmd].key = "<SPC>" .. v.key
	lazy_cmd[v.cmd].key_plugin = "<leader>" .. v.key
end
vim.keymap.set("n", "<leader>pl", ":Lazy<CR>", { noremap = true })

require("lazy").setup({
	require("conf.plugins.appearance"),  -- nvim appearance enhancment
	require("conf.plugins.editor"),  -- nvim editor enhancement
	require("conf.plugins.coc"),  -- coc
	require("conf.plugins.treesitter"),
	-- require("conf.plugins.go"),
	-- require("conf.plugins.telescope").config,
	-- require("conf.plugins.fzf"),
	-- require("conf.plugins.notify"),
	-- require("conf.plugins.tabline"),
	-- require("conf.plugins.autocomplete").config,
	-- require("conf.plugins.debugger"),
	-- require("conf.plugins.lspconfig").config,
	-- require("conf.plugins.flutter"),
	-- require("conf.plugins.joshuto"),
	-- require("conf.plugins.surround"),
	-- require("conf.plugins.project"),
	-- require("conf.plugins.wilder"),
	-- require("conf.plugins.multi-cursor"),
	-- require("conf.plugins.copilot"),
	-- require("conf.plugins.markdown"),
	-- require("conf.plugins.indent"),
	-- require("conf.plugins.search"),
	-- require("conf.plugins.yank"),
	-- require("conf.plugins.snippets"),
	-- require("conf.plugins.window-management"),
	-- require("conf.plugins.undo"),
	-- require("conf.plugins.ft"),
	-- require("conf.plugins.fun"),
	-- require("conf.plugins.winbar"),
	-- require("conf.plugins.leap"),
	-- { "dstein64/vim-startuptime" },
}, {
})

-- require("plugin.vertical_cursor_movement")

-- local swap_ternary = require("plugin.swap_ternary")
-- vim.keymap.set("n", "<leader>st", swap_ternary.swap_ternary, { noremap = true })

-- require("plugin.compile_run")
