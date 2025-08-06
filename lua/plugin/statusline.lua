-- https://github.com/nvim-lualine/lualine.nvim
-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.

local uv = vim.loop
local ime_icon = ""
local timer = nil

-- 异步刷新输入法状态
local function update_ime_status()
	uv.spawn("im-select", {
		args = {},
	}, function(code, signal)
		-- 读取输出
		local stdout = uv.new_pipe(false)
		local handle
		handle = uv.spawn("im-select", { stdio = { nil, stdout, nil } }, function()
			stdout:read_stop()
			stdout:close()
			handle:close()
		end)
		stdout:read_start(function(err, data)
			if err then
				return
			end
			if data then
				local id = data:gsub("%s+", "")
				if id == "com.apple.keylayout.Colemak" then
					ime_icon = "󰌌 US"
				elseif id == "com.apple.inputmethod.SCIM.ITABC" then
					ime_icon = "拼"
				else
					ime_icon = ""
				end
			end
		end)
	end)
end

-- 定时刷新(每 2 秒)
timer = uv.new_timer()
timer:start(0, 2000, vim.schedule_wrap(update_ime_status))

-- lualine 组件
local function ime_status()
	return ime_icon
end

local function cfg()
	-- cool function for progress
	local progress = function()
		return "%l/%L:%c"
	end
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = true,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = { "mode", ime_status },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = {},
			lualine_y = { "filesize", "encoding", "fileformat", "filetype" },
			lualine_z = { progress, "progress", "selectioncount" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- You can optionally lazy-load heirline on UiEnter
	-- to make sure all required plugins and colorschemes are loaded before setup
	-- event = "UiEnter",
	config = cfg,
}
