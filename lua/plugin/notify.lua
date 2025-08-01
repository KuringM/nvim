-- https://github.com/rcarriga/nvim-notify
-- A fancy, configurable, notification manager for NeoVim

local function notify_cfg()
	local notify = require("notify")
	vim.notify = notify
	notify.setup({
		on_open = function(win)
			vim.api.nvim_win_set_config(win, { border = "none" })
		end,
		level = 2,
		timeout = 1000,
		max_height = 5,
		stages = "slide",
		fps = 60,
		render = "wrapped-compact",
		minimum_width = 50,
		top_down = true,
	})
	local opts = { noremap = true, silent = true }
	vim.keymap.set("n", "<leader>;", function()
		require("telescope").extensions.notify.notify({
			layout_strategy = "vertical",
			layout_config = {
				width = 0.9,
				height = 0.9,
				-- preview_height = 0.1,
			},
			wrap_results = true,
		})
	end, opts)
end

return {
	"rcarriga/nvim-notify",
	config = notify_cfg,
}
