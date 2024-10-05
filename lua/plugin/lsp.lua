local a = "plugin/LSP/"

return {
	require(a .. "nvim-treesitter"),
	require(a .. "coc"),
	require(a .. "go"),
	require(a .. "nvim-dap"),
	require(a .. "go"),
	require(a .. "dart"),
	require(a .. "flutter"),
	require(a .. "markdown"),
	{ "fladson/vim-kitty" }, -- Vim syntax highlighting for Kitty terminal config files
}
