-- Add/change/delete surrounding delimiter pairs with ease. Written with ❤️ in Lua.
return {
	"kylechui/nvim-surround",
	version = "*",
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({})
	end,
}
