local a = "conf/plugins/plugins_lsp/"

return {
	require(a .. "nvim-treesitter"),
	require(a .. "coc"),
	require(a .. "go"),
	require(a .. "nvim-dap"),
	require(a .. "go"),
	require(a .. "dart"),
	require(a .. "flutter"),
	require(a .. "markdown"),
}
