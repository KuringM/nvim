local config = {}

-- Jump to any definition and references 👁 IDE madness without overhead 🚀
config.anyjump = {
	"pechorin/any-jump.vim",
	keys = { "j" },
	config = function()
		vim.keymap.set("n", "j", ":AnyJump<CR>", { noremap = true })
		vim.keymap.set("x", "j", ":AnyJumpVisual<CR>", { noremap = true })
		vim.g.any_jump_disable_default_keybindings = true
		vim.g.any_jump_window_width_ratio = 0.9
		vim.g.any_jump_window_height_ratio = 0.9
	end,
}

-- Improved fzf.vim written in lua
config.fzf = {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = { "<c-f>" },
	config = function()
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
	end,
}

-- Navigate your code with search labels, enhanced character motions and Treesitter integration
config.flash = {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		search = {
			mode = "fuzzy",
		},
		label = {
			style = "overlay", ---@type "eol" | "overlay" | "right_align" | "inline" -- position of the label extmark
			reuse = "all", ---@type "lowercase" | "all"
			rainbow = {
				enabled = true,
				shade = 8,
			},
		},
	},
	keys = {
		-- {
		-- 	"<ESC>",
		-- 	mode = { "n" },
		-- 	function()
		-- 		require("flash").jump({
		-- 			remote_op = {
		-- 				restore = true,
		-- 				motion = true,
		-- 			},
		-- 		})
		-- 	end,
		-- 	desc = "Flash",
		-- },
		{
			"T",
			mode = { "n", "o", "x" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		{
			"/",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Flash Treesitter Search",
		},
	},
}

-- use Ranger in a floating window
config.rnvimr = {
	"kevinhwang91/rnvimr",
	keys = { "R" },
	build = {
		"pip3 install ranger-fm pynvim",
	},
	config = function()
		vim.cmd([[
			let g:rnvimr_enable_ex = 1
			let g:rnvimr_enable_pick = 1
			" let g:rnvimr_draw_border = 0
			let g:rnvimr_enable_bw = 1
			highlight link RnvimrNormal CursorLine
			nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
			let g:rnvimr_action = {
									\ '<C-t>': 'NvimEdit tabedit',
									\ '<C-x>': 'NvimEdit split',
									\ '<C-v>': 'NvimEdit vsplit',
									\ 'gw': 'JumpNvimCwd',
									\ 'yw': 'EmitRangerCwd'
									\ }
			let g:rnvimr_layout = { 'relative': 'editor',
									\ 'width': &columns,
									\ 'height': &lines,
									\ 'col': 0,
									\ 'row': 0,
									\ 'style': 'minimal' }
			let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]
		]])
	end,
}

return {
	config.anyjump,
	config.fzf,
	config.flash,
	-- config.rnvimr,
}
