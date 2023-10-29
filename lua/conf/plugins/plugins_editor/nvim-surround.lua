return {
	"kylechui/nvim-surround",  -- Add/change/delete surrounding delimiter pairs with ease. Written with ❤️ in Lua.
	version = "*",
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({})
	end
}
