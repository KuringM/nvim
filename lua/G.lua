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
		for i, v in pairs(map) do
			if type(i) == "number" then
				vim.keymap.set(map[1], map[2], map[3], map[4])
				break
			else
				vim.keymap.set(map.mode, map.lhs, map.rhs, map.opt)
				break
			end
		end
	end
end

function G.hl(hls)
	for _, hl in pairs(hls) do
		vim.api.nvim_set_hl(0, hl[1], hl[2])
	end
end

return G
