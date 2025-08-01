-- https://github.com//numToStr/Comment.nvim
-- 🧠 💪 // Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more

local function comment_cfg()
	require("Comment").setup()
	vim.api.nvim_set_keymap("n", "<leader>c", "gcc", { desc = "Toggles the current line using linewise comment" })
	vim.api.nvim_set_keymap("v", "<leader>c", "gc", { desc = "Toggles the current line using linewise comment" })
end

return {
	"numToStr/Comment.nvim",
	config = comment_cfg,
}
