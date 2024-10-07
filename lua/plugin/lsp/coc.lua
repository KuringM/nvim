return {
	"neoclide/coc.nvim", -- Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers.
	branch = "release",
	dependencies = {
		"theniceboy/vim-snippets",
		-- "honza/vim-snippets",
	},
	build = {
		"brew install lua-language-server",
		"brew install bash-language-server",
		"pip3 install pynvim",
	},
	config = function()
		vim.g.coc_global_extensions = {
			"coc-explorer",
			"coc-css",
			"coc-html",
			"coc-json",
			"coc-lua",
			"coc-snippets",
			"coc-translator",
			"coc-vimlsp",
			"coc-vimtex",
			"coc-yaml",
		}

		vim.opt.backup = false
		vim.opt.writebackup = false
		vim.opt.updatetime = 300
		vim.opt.signcolumn = "yes"

		local keyset = vim.keymap.set
		function _G.check_back_space() -- Autocomplete
			local col = vim.fn.col(".") - 1
			return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
		end

		local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
		keyset(
			"i",
			"<TAB>",
			[[coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()]],
			opts
		)
		keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
		keyset("i", "<c-n>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
		keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
		keyset("i", "<c-o>", "coc#refresh()", { silent = true, expr = true }) -- trigger completion

		function _G.show_docs() -- show documentation in preview window
			local cw = vim.fn.expand("<cword>")
			if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
				vim.api.nvim_command("h " .. cw)
			elseif vim.api.nvim_eval("coc#rpc#ready()") then
				vim.fn.CocActionAsync("doHover")
			else
				vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
			end
		end
		keyset("n", "<leader>h", "<CMD>lua _G.show_docs()<CR>", { silent = true })

		-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
		vim.api.nvim_create_augroup("CocGroup", {})
		vim.api.nvim_create_autocmd("CursorHold", {
			group = "CocGroup",
			command = "silent call CocActionAsync('highlight')",
			desc = "Highlight symbol under cursor on CursorHold",
		})

		-- coc explorer
		keyset("n", "tt", "<CMD>CocCommand explorer<CR>")
		-- coc-translator
		keyset("n", "ts", "<Plug>(coc-translator-p)")

		-- coc-snippets
		keyset("i", "<c-e>", "<Plug>(coc-snippets-expand-jump)")
		keyset("i", "<c-CR>", "<Plug>(coc-snippets-expand)")
		keyset("v", "<c-e>", "<Plug>(coc-snippets-select)")
		vim.g.coc_snippet_next = "<c-e>"
		vim.g.coc_snippet_prev = "<c-u>"

		-- coc-diagnostic
		keyset("n", "<leader>-", "<Plug>(coc-diagnostic-prev)", { silent = true })
		keyset("n", "<leader>=", "<Plug>(coc-diagnostic-next)", { silent = true })

		-- coc code navigation
		-- keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
		keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
		keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
		keyset("n", "gr", "<Plug>(coc-references)", { silent = true })

		-- Symbol renaming
		keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })

		-- Formatting selected code
		keyset("x", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })
		keyset("n", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })

		-- Setup formatexpr specified filetype(s)
		vim.api.nvim_create_autocmd("FileType", {
			group = "CocGroup",
			pattern = "typescript,json",
			command = "setl formatexpr=CocAction('formatSelected')",
			desc = "Setup formatexpr specified filetype(s).",
		})

		-- Update signature help on jump placeholder
		vim.api.nvim_create_autocmd("User", {
			group = "CocGroup",
			pattern = "CocJumpPlaceholder",
			command = "call CocActionAsync('showSignatureHelp')",
			desc = "Update signature help on jump placeholder",
		})

		-- Map function and class text objects
		-- NOTE: Requires 'textDocument.documentSymbol' support from the language server
		keyset("x", "kf", "<Plug>(coc-funcobj-i)", opts)
		keyset("o", "kf", "<Plug>(coc-funcobj-i)", opts)
		keyset("x", "af", "<Plug>(coc-funcobj-a)", opts)
		keyset("o", "af", "<Plug>(coc-funcobj-a)", opts)
		keyset("x", "kc", "<Plug>(coc-classobj-i)", opts)
		keyset("o", "kc", "<Plug>(coc-classobj-i)", opts)
		keyset("x", "ac", "<Plug>(coc-classobj-a)", opts)
		keyset("o", "ac", "<Plug>(coc-classobj-a)", opts)
	end,
}
