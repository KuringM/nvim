local config = {}

-- IDE-like breadcrumbs, out of the box
config.dropbar = {
	"Bekaboo/dropbar.nvim",
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	config = function()
		local api = require("dropbar.api")
		vim.keymap.set("n", [[<leader>dp]], api.pick, { desc = "open dropbar pick" })
		vim.keymap.set("n", [[<leader>dg]], api.goto_context_start, { desc = "dropbar goto context start" })
		vim.keymap.set("n", [[<leader>ds]], api.select_next_context, { desc = "dropbar select next context" })

		local confirm = function()
			local menu = api.get_current_dropbar_menu()
			if not menu then
				return
			end
			local cursor = vim.api.nvim_win_get_cursor(menu.win)
			local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
			if component then
				menu:click_on(component)
			end
		end

		local quit_curr = function()
			local menu = api.get_current_dropbar_menu()
			if menu then
				menu:close()
			end
		end

		require("dropbar").setup({
			menu = {
				keymaps = {
					["<LeftMouse>"] = function()
						local menu = api.get_current_dropbar_menu()
						if not menu then
							return
						end
						local mouse = vim.fn.getmousepos()
						if mouse.winid ~= menu.win then
							local parent_menu = api.get_dropbar_menu(mouse.winid)
							if parent_menu and parent_menu.sub_menu then
								parent_menu.sub_menu:close()
							end
							if vim.api.nvim_win_is_valid(mouse.winid) then
								vim.api.nvim_set_current_win(mouse.winid)
							end
							return
						end
						menu:click_at({ mouse.line, mouse.column }, nil, 1, "l")
					end,
					["<CR>"] = confirm,
					["i"] = confirm,
					["<esc>"] = quit_curr,
					["q"] = quit_curr,
					["n"] = quit_curr,
					["<MouseMove>"] = function()
						local menu = api.get_current_dropbar_menu()
						if not menu then
							return
						end
						local mouse = vim.fn.getmousepos()
						if mouse.winid ~= menu.win then
							return
						end
						menu:update_hover_hl({ mouse.line, mouse.column - 1 })
					end,
					["f"] = function()
						local menu = api.get_current_dropbar_menu()
						if not menu then
							return
						end
						menu:fuzzy_find_open()
					end,
				},
			},
		})
	end,
}

return {
	config.dropbar,
}
