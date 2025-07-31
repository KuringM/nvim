-- https://github.com/neoclide/coc.nvim
-- Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers.

local G = require("G")
local config = {}

local coc_snippet = function()
	G.map({
		{ "i", "<c-e>", "<Plug>(coc-snippets-expand-jump)" },
		{ "i", "<c-CR>", "<Plug>(coc-snippets-expand)" },
		{ "v", "<c-e>", "<Plug>(coc-snippets-select)" },
		{ "x", "<c-x>", "<Plug>(coc-convert-snippet)" },
	})
	vim.g.coc_snippet_next = "<c-e>"
	vim.g.coc_snippet_prev = "<c-u>"
end

-- show documentation in preview window
local coc_showDoc = function()
	local function is_nvim_config_lua()
		return vim.bo.filetype == "lua" and vim.api.nvim_buf_get_name(0):find(vim.fn.stdpath("config"), 1, true)
	end
	function _G.show_docs()
		local cw = vim.fn.expand("<cword>")
		if
			vim.bo.filetype == "help"
			or vim.bo.filetype == "vim"
			or (vim.bo.filetype == "lua" and is_nvim_config_lua())
		then
			vim.api.nvim_command("h " .. cw)
		elseif vim.fn.exists(":CocActionAsync") == 2 and vim.api.nvim_eval("coc#rpc#ready()") then
			vim.fn.CocActionAsync("doHover")
		else
			vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
		end
	end
	G.map({ { "n", "<leader>h", "<CMD>lua _G.show_docs()<CR>", { silent = true } } })
end

local function coc_cfgs()
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
		-- "coc-ds-pinyin-lsp",
	}

	vim.opt.backup = false
	vim.opt.writebackup = false
	vim.opt.updatetime = 300
	vim.opt.signcolumn = "yes"

	function _G.check_back_space() -- Autocomplete
		local col = vim.fn.col(".") - 1
		return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
	end

	local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
	local opts1 = { silent = true, nowait = true }
	G.map({
		{
			"i",
			"<TAB>",
			[[coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()]],
			opts,
		},
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
			"<c-i>",
			[[coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()]],
			opts,
		},
		{
			"i",
			"<cr>",
			[[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
			opts,
		},
		-- { "i", "<c-o>",      "coc#refresh()",								{ silent = true, expr = true } }, -- trigger completion
		{ "i", "<c-o>", "<Del>", { silent = true } }, -- der char after cursor
		{ "n", "tt", "<CMD>CocCommand explorer<CR>" },
		{ "n", "ts", "<Plug>(coc-translator-p)" },
		{ "n", "<leader>-", "<Plug>(coc-diagnostic-prev)", { silent = true } }, -- navigation diagnostic
		{ "n", "<leader>=", "<Plug>(coc-diagnostic-next)", { silent = true } },
		{ "n", "gd", "<Plug>(coc-definition)", { silent = true } }, -- Goto code navigation
		{ "n", "gy", "<Plug>(coc-type-definition)", { silent = true } },
		{ "n", "gi", "<Plug>(coc-implementation)", { silent = true } },
		{ "n", "gr", "<Plug>(coc-references)", { silent = true } },
		{ "n", "<leader>rn", "<Plug>(coc-rename)", { silent = true } }, -- Symbol renaming
		{ "x", "<leader>f", "<Plug>(coc-format-selected)", { silent = true } }, -- Formatting selected code
		{ "n", "<leader>f", "<Plug>(coc-format-selected)", { silent = true } },
		{ "x", "kf", "<Plug>(coc-funcobj-i)", opts1 }, -- Map function and class text objects
		{ "o", "kf", "<Plug>(coc-funcobj-i)", opts1 },
		{ "x", "af", "<Plug>(coc-funcobj-a)", opts1 },
		{ "o", "af", "<Plug>(coc-funcobj-a)", opts1 },
		{ "x", "kc", "<Plug>(coc-classobj-i)", opts1 },
		{ "o", "kc", "<Plug>(coc-classobj-i)", opts1 },
		{ "x", "ac", "<Plug>(coc-classobj-a)", opts1 },
		{ "o", "ac", "<Plug>(coc-classobj-a)", opts1 },
	})

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
		{ "CocHintSign", { fg = "#15aabf" } },
		{ "CocUnusedHighlight", { fg = "#c0c0c0", italic = true } },
	})

	-- coc_snippet()
	coc_showDoc()
end

return {
	"neoclide/coc.nvim",
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
	config = coc_cfgs,
}
