local G = {}
-- Use G to Call vim Api
G.g = vim.g
G.b = vim.b
G.o = vim.o
G.v = vim.v
G.fn = vim.fn
G.api = vim.api
G.opt = vim.opt
G.treesitter = vim.treesitter

-- remap keys
function G.map(maps)
	for _, map in pairs(maps) do
		if map.opt["buffer"] then
			map.opt["buffer"] = nil
			-- remap keys in <buffer> files
			G.api.nvim_buf_set_keymap(0, map.mode, map.lhs, map.rhs, map.opt)
		else
			for i, v in pairs(map) do
				if type(i) == "number" then
					-- {"", "", "", ""}
					vim.keymap.set(map[1], map[2], map[3], map[4])
					break
				else
					-- {mode="", lhs="", rhs="", opt=""}
					vim.keymap.set(map.mode, map.lhs, map.rhs, map.opt)
					break
				end
			end
		end
	end
end

return G
