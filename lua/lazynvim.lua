-- use lazy.nvim to manage nvim plugins
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Map lazy.nvim commands shortcuts
local function map_lazy_keys()
	local lazy_cmd = require("lazy.view.config").commands
	local mappings = {
		{ cmd = "install", key = "i" },
		{ cmd = "update", key = "u" },
		{ cmd = "sync", key = "s" },
		{ cmd = "clean", key = "cl" },
		{ cmd = "check", key = "ch" },
		{ cmd = "log", key = "l" },
		{ cmd = "restore", key = "rs" },
		{ cmd = "profile", key = "p" },
	}
	for _, v in ipairs(mappings) do
		lazy_cmd[v.cmd].key = "<SPC>" .. v.key
		lazy_cmd[v.cmd].key_plugin = "<leader>" .. v.key
	end
	-- Additional key to open Lazy
	vim.keymap.set("n", "<leader>pl", ":Lazy<CR>", { noremap = true, silent = true, desc = "Open Lazy" })
end

map_lazy_keys()

-- Plugins
local plugin_prefix = "plugin."
local plugin_modules = {
	"autopairs",
	"bufferline",
	"change",
	"cmp",
	--"coc",
	"colorscheme",
	"cursors",
	"dashboard",
	"file",
	"fold",
	"formatter",
	"git",
	"highlighter",
	"lsp",
	"markdown",
	"move",
	"notification",
	"scrollbar",
	"snips",
	"statuscolumn",
	"statusline",
	"telescope",
	"treesitter",
	"vimtex",
	"wildmenu",
	"winbar",
}

local specs = vim.tbl_map(function(name)
	return require(plugin_prefix .. name)
end, plugin_modules)

require("lazy").setup({
	spec = specs,
	install = { colorscheme = { "deus" } },
	checker = { enable = true },
})
