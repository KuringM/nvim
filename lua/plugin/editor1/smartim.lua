return {
	"ybian/smartim", -- A Vim plugin to make it stand well with input methods (Mac only)
	config = function()
		vim.g.smartim_default = "com.apple.keylayout.Colemak"
	end,
}
