local G = require("G")

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
			"coc-clangd",
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

		function _G.check_back_space() -- Autocomplete
			local col = vim.fn.col(".") - 1
			return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
		end

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

		local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
		local opts1 = { silent = true, nowait = true }
		G.map({
			{ "i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts },
			{
				"i",
				"<TAB>",
				[[coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()]],
				opts,
			},
			{
				"i",
				"<c-n>",
				[[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], -- prev coc popupmenu or del char before cursor
				opts,
			},
			{
				"i",
				"<cr>",
				[[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
				opts,
			},
			-- { "i", "<c-o>",      "coc#refresh()",								{ silent = true, expr = true } }, -- trigger completion
			{ "i", "<c-o>",      "<Del>",							        	{ silent = true } }, -- der char after cursor
			{ "n", "<leader>h",  "<CMD>lua _G.show_docs()<CR>", { silent = true } },
			{ "n", "tt",         "<CMD>CocCommand explorer<CR>" },
			{ "n", "ts",         "<Plug>(coc-translator-p)" },
			{ "i", "<c-e>",      "<Plug>(coc-snippets-expand-jump)" }, -- both expand and jump (make expand higher priority.)
			{ "i", "<c-CR>",     "<Plug>(coc-snippets-expand)" }, -- trigger snippet expand
			{ "v", "<c-e>",      "<Plug>(coc-snippets-select)" }, -- select text for visual placeholder of snippet
			{ "n", "<leader>-",  "<Plug>(coc-diagnostic-prev)", { silent = true } }, -- navigation diagnostic
			{ "n", "<leader>=",  "<Plug>(coc-diagnostic-next)", { silent = true } },
			{ "n", "gd",         "<Plug>(coc-definition)",      { silent = true } }, -- Goto code navigation
			{ "n", "gy",         "<Plug>(coc-type-definition)", { silent = true } },
			{ "n", "gi",         "<Plug>(coc-implementation)",  { silent = true } },
			{ "n", "gr",         "<Plug>(coc-references)",      { silent = true } },
			{ "n", "<leader>rn", "<Plug>(coc-rename)",          { silent = true } }, -- Symbol renaming
			{ "x", "<leader>f",  "<Plug>(coc-format-selected)", { silent = true } }, -- Formatting selected code
			{ "n", "<leader>f",  "<Plug>(coc-format-selected)", { silent = true } },
			{ "x", "kf",         "<Plug>(coc-funcobj-i)",	 opts1 }, -- Map function and class text objects
			{ "o", "kf",         "<Plug>(coc-funcobj-i)",	 opts1 },
			{ "x", "af",         "<Plug>(coc-funcobj-a)",	 opts1 },
			{ "o", "af",         "<Plug>(coc-funcobj-a)",	 opts1 },
			{ "x", "kc",         "<Plug>(coc-classobj-i)", opts1 },
			{ "o", "kc",         "<Plug>(coc-classobj-i)", opts1 },
			{ "x", "ac",         "<Plug>(coc-classobj-a)", opts1 },
			{ "o", "ac",         "<Plug>(coc-classobj-a)", opts1 },
		})

		vim.g.coc_snippet_next = "<c-e>" -- jump to next placeholder
		vim.g.coc_snippet_prev = "<c-u>" -- jump to previous placeholder

		-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
		vim.api.nvim_create_augroup("CocGroup", {})
		vim.api.nvim_create_autocmd("CursorHold", {
			group = "CocGroup",
			command = "silent call CocActionAsync('highlight')",
			desc = "Highlight symbol under cursor on CursorHold",
		})

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
		G.hl({
			{ "CocHintSign", { fg = "#15aabf" }},
			{"CocUnusedHighlight", { fg = "#c0c0c0", italic = true }}
		})
	end,
}
