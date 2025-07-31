-- https://github.com/theniceboy/nvim-deus
-- The color scheme for neovim

local config = {}

local function deus_cfg()
	vim.o.termguicolors = true
	-- vim.o.t_Co = 256
	vim.cmd([[
		let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
		let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
		]])
	vim.o.background = dark --Setting dark mode
	vim.g.deus_termcolors = 256
	-- vim.g.deus_background = "mid"
	vim.cmd([[colorscheme deus]])
	vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
	vim.api.nvim_set_hl(0, "FloatBorder", { link = "Comment" })
end

config.nvimdeus = {
	"theniceboy/nvim-deus",
	-- "Avimitin/neovim-deus",
	lazy = false,
	priority = 1000,
	config = deus_cfg,
}

-- https://github.com/nvim-zh/colorful-winsep.nvim
-- Make your nvim window separators colorful

config.colorfulWinsep = {
	"nvim-zh/colorful-winsep.nvim",
	config = true,
	event = { "WinNew" },
}

return {
	config.nvimdeus,
	config.colorfulWinsep,
}
