-- https://github.com/nvim-lualine/lualine.nvim
-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.

-- use im-select
local function ime_status()
  -- 运行 shell 命令获取输入法 ID
  local handle = io.popen("im-select")
  if handle == nil then return "" end
  local result = handle:read("*a")
  handle:close()

  result = result:gsub("%s+", "")  -- 去掉换行符

  -- 根据输入法 ID 返回图标
  if result == "com.apple.keylayout.Colemak" then
    return "󰌌 US"  -- 英文图标
  elseif result == "com.apple.inputmethod.SCIM.ITABC" then
    return "拼"      -- 拼音
  else
    return ""       -- 未知输入法
  end
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- You can optionally lazy-load heirline on UiEnter
	-- to make sure all required plugins and colorschemes are loaded before setup
	-- event = "UiEnter",
	config = function()
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
	end,
}
