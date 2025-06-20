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

local lazy_cmd = require("lazy.view.config").commands
local lazy_keys = {
	{ cmd = "install", key = "i" },
	{ cmd = "update", key = "u" },
	{ cmd = "sync", key = "s" },
	{ cmd = "clean", key = "cl" },
	{ cmd = "check", key = "ch" },
	{ cmd = "log", key = "l" },
	{ cmd = "restore", key = "rs" },
	{ cmd = "profile", key = "p" },
}
for _, v in ipairs(lazy_keys) do
	lazy_cmd[v.cmd].key = "<SPC>" .. v.key
	lazy_cmd[v.cmd].key_plugin = "<leader>" .. v.key
end
vim.keymap.set("n", "<leader>pl", ":Lazy<CR>", { noremap = true })

local a = "plugin."
require("lazy").setup({
	spec = {
		require(a .. "autopairs"),
		require(a .. "bufferline"),
		require(a .. "change"),
		require(a .. "cmp"),
		-- require(a .. "coc"),
		require(a .. "colorscheme"),
		require(a .. "cursors"),
		require(a .. "dashboard"),
		require(a .. "file"),
		require(a .. "fold"),
		require(a .. "formatter"),
		require(a .. "git"),
		require(a .. "highlighter"),
		require(a .. "lsp"),
		require(a .. "markdown"),
		require(a .. "move"),
		require(a .. "notification"),
		require(a .. "scrollbar"),
		require(a .. "statuscolumn"),
		require(a .. "statusline"),
		require(a .. "telescope"),
		require(a .. "treesitter"),
		-- require(a .. "ultisnips"),
		require(a .. "vimtex"),
		require(a .. "wildmenu"),
		require(a .. "winbar"),
	},
	install = { colorscheme = { "deus" } },
	checker = { enable = true },
})
