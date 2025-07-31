-- https://github.com//nvimdev/dashboard-nvim
-- vim dashboard

local G = require("G")
local colors = require("colors")

local function dashboard_cfg()
	require("dashboard").setup({
		theme = "hyper",
		-- preview = {
		-- 	command = "lolcrab",
		-- 	file_path = "~/.config/nvim/dashboard.txt",
		-- 	file_width = 69,
		-- 	file_height = 10,
		-- },
	})
	G.hl({
		{ "DashboardHeader", { fg = colors.orange } },
		{ "DashboardShortCut", { fg = colors.orange } },
		{ "DashboardProjectTitle", { fg = colors.orange } },
		{ "DashboardMruTitle", { fg = colors.orange } },
		{ "DashboardFiles", { fg = colors.green_dark } },
		{ "DashboardFooter", { fg = colors.orange } },
	})
	vim.g.dashboard_custom_header = {}
end

return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	config = dashboard_cfg,
}
