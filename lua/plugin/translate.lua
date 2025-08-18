-- https://github.com/uga-rosa/translate.nvim
-- Use any external translate command/API in nvim.

return {
	"uga-rosa/translate.nvim",
	cmd = { "Translate", "TranslateReplace", "TranslateInput", "TranslateInputReplace" },
	keys = {
		{ "tr", "viw:Translate zh<CR>", mode = "n", desc = "翻译光标下单词(中文)" },
		{ "tr", ":Translate zh<CR>", mode = "v", desc = "翻译选中内容(中文)" },
		{ "<leader>tr", "<cmd>Translate<cr>", mode = { "n", "v" }, desc = "翻译到目标语言" },
		{ "<leader>tR", "<cmd>TranslateReplace<cr>", mode = { "n", "v" }, desc = "翻译并替换" },
	},
	opts = {
		default = {
			-- 你可以用 translate-shell、deepl、google 等
			command = "google",
			output = "floating", -- 输出方式:floating / split / replace 等
		},
		preset = {
			output = {
				split = { append = true },
			},
		},
	},
}
