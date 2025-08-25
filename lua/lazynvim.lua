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
local plugin_modules = {
	"anyjump",
	"autopairs",
	-- "blinkcmp",
	-- "cmp-lsp-rimels",
	"bufferline",
	-- "nvimcmp",
	"coc",
	"colorizer",
	"colorscheme",
	"comment",
	"conform",
	"dashboard",
	"flash",
	-- "fold",
	"fzf",
	"git",
	"hlchunk",
	"hlslens",
	"lsp",
	"luasnip",
	"markdown",
	"multicursors",
	"neoclip",
	"notify",
	-- "nvimtree",
	-- "scrollbar",
	"snacks",
	-- "statuscolumn",
	"statusline",
	"surround",
	"tabular",
	"telescope",
	"tex",
	-- "translate",
	"treesitter",
	"ultisnips",
	"undotree",
	"whichkey",
	"wildmenu",
	-- "winbar",
}

-- Safely require plugin modules
local specs = {}
for _, name in ipairs(plugin_modules) do
	local ok, plugin = pcall(require, "plugin." .. name)
	if ok then
		table.insert(specs, plugin)
	else
		local log_path = vim.fn.stdpath("cache") .. "/lazy_load_errors.log"
		vim.fn.writefile({ "plugin." .. name .. ": " .. plugin }, log_path, "a")
		vim.notify("Error loading plugin." .. name .. ", logged to lazy_load_errors.log", vim.log.levels.ERROR)
	end
end

require("lazy").setup({
	spec = specs,
	install = { colorscheme = { "deus" } },
	checker = { enable = true },
})
