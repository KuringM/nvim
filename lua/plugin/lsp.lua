local a = "plugin/lsp/"

return {
	{ "fladson/vim-kitty" }, -- Vim syntax highlighting for Kitty terminal config files
	require(a .. "nvim-treesitter"),
	require(a .. "coc_nvim"),
	require(a .. "nvim-dap"),
	require(a .. "markdown"),
	-- require(a .. "coq_nvim"),
}
