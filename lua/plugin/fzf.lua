-- https://github.com/ibhagwan/fzf-lua
-- Improved fzf.vim written in lua

local function fzf_cfg()
	local fzf = require("fzf-lua")
	local m = { noremap = true }
	vim.keymap.set("n", "<c-f>", function()
		-- fzf.live_grep_resume({ multiprocess = true, debug = true })
		fzf.grep({ search = "", fzf_opts = { ["--layout"] = "default" } })
	end, m)
	vim.keymap.set("x", "<c-f>", function()
		-- fzf.live_grep_resume({ multiprocess = true, debug = true })
		fzf.grep_visual({ fzf_opts = { ["--layout"] = "default" } })
	end, m)
	fzf.setup({
		global_resume = true,
		global_resume_query = true,
		winopts = {
			preview = {
				-- default = "bat",
				layout = "vertical", -- horizontal|vertical|flex
			},
		},
		keymap = {
			builtin = {
				["<c-f>"] = "toggle-fullscreen",
				["<c-r>"] = "toggle-preview-wrap",
				["<c-p>"] = "toggle-preview",
				["<c-y>"] = "preview-page-down",
				["<c-l>"] = "preview-page-up",
				["<S-left>"] = "preview-page-reset",
			},
			fzf = {
				["esc"] = "abort",
				["ctrl-h"] = "unix-line-discard",
				["ctrl-k"] = "half-page-down",
				["ctrl-b"] = "half-page-up",
				["ctrl-n"] = "beginning-of-line",
				["ctrl-a"] = "end-of-line",
				["alt-a"] = "toggle-all",
				["ctrl-e"] = "down",
				["ctrl-u"] = "up",
			},
		},
	})
end

return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = { "<c-f>" },
	config = fzf_cfg,
}
