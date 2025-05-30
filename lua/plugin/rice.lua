local a = [[/plugin/rice/]]

return {
	require(a .. "bufferline"),
	require(a .. "colorscheme"),
	require(a .. "dashboard"),
	require(a .. "fold"),
	require(a .. "highlighter"),
	require(a .. "notification"),
	require(a .. "scrollbar"),
	require(a .. "statuscolumn"),
	require(a .. "statusline"),
	require(a .. "wildmenu"),
	require(a .. "winbar"),
}
