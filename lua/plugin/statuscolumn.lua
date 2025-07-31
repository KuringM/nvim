-- https://github.com/luukvbaal/statuscol.nvim
-- Status column plugin that provides a configurable 'statuscolumn' and click handlers.

return {
	"luukvbaal/statuscol.nvim",
	config = function()
		local function hexToRgb(hex_str)
			local hex = "[abcdef0-9][abcdef0-9]"
			local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
			hex_str = string.lower(hex_str)

			assert(string.find(hex_str, pat) ~= nil, "hex_to_rgb: invalid hex_str: " .. tostring(hex_str))

			local r, g, b = string.match(hex_str, pat)
			return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
		end
		local function blend(fg, bg, alpha)
			bg = hexToRgb(bg)
			fg = hexToRgb(fg)

			local blendChannel = function(i)
				local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
				return math.floor(math.min(math.max(0, ret), 255) + 0.5)
			end

			return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
		end
		local builtin = require("statuscol.builtin")
		local c = require("statuscol.ffidef").C
		for i = 0, 8, 1 do
			vim.api.nvim_set_hl(0, "FoldCol" .. i, {
				bg = blend(
					string.format("#%06x", vim.api.nvim_get_hl(0, { name = "Normal" }).fg),
					string.format("#%06x", vim.api.nvim_get_hl(0, { name = "Normal" }).bg),
					0.125 * i
				),
			})
		end
		require("statuscol").setup({
			relculright = true,
			segments = {
				{ text = { "%s" }, click = "v:lua.ScSa" },
				{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
				{
					-- hl = 'FoldColumn',
					text = {
						function(args)
							local fold_level = c.fold_info(args.wp, args.lnum).level
							local hl = "%#FoldCol" .. fold_level .. "#"
							if fold_level > 8 then
								hl = "%#FoldCol8#"
							end
							return hl .. " "
						end,
					},
					click = "v:lua.ScFa",
				},
			},
		})
	end,
}
