local config = {}

-- Nvim Treesitter configurations and abstraction layer
config.treesitter = {
	"romus204/tree-sitter-manager.nvim",
	dependencies = {},
	lazy = false,
	build = {
		"brew install tree-sitter",
		"brew install tree-sitter-cli",
	},
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"css",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"toml",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		},

		auto_install = true,
		highlight = true,

		-- Neovim 自带的 parser，不需要重复自动安装
		noauto_install = {
			"c",
			"lua",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
		},
	},
}

return {
	config.treesitter,
}
