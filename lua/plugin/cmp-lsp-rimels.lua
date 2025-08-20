-- https://github.com/liubianshi/cmp-lsp-rimels/tree/blink.cmp
-- Neovim cmp source for rime-ls: support nvim-cmp and blink.cmp

return {
	"liubianshi/cmp-lsp-rimels",
	keys = { { "<localleader>f", mode = "i" } },
	branch = "blink.cmp",
	config = function()
		vim.system({ "~/rime-ls/target/release/rime_ls", "--listen", "127.0.0.1:9257" }, { detach = true })
		-- vim.system({ "rime_ls", "--listen", "127.0.0.1:9257" }, { detach = true })
		require("rimels").setup({
			cmd = vim.lsp.rpc.connect("127.0.0.1", 9257),
		})
	end,
}
