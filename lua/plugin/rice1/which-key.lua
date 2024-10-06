return {
	"folke/which-key.nvim", -- 💥 Create key bindings that stick. WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type.
	event = "VeryLazy",
	opts = {},
	config = function()
		require("which-key").setup({
			preset = "helix", -- classic | modern | helix
			keys = {
				scroll_down = "<C-E>", -- binding to scroll down inside the popup
				scroll_up = "<C-U>", -- binding to scroll up inside the popup
			},
		})
	end,
}
