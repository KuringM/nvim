local G = {}

-- remap keys
function G.map(maps)
	for _, map in pairs(maps) do
		vim.keymap.set(map[1], map[2], map[3], map[4])
	end
end

function G.hl(hls)
	for _, hl in pairs(hls) do
		vim.api.nvim_set_hl(0, hl[1], hl[2])
	end
end

return G
