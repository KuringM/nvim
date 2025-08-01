-- https://github.com//windwp/nvim-autopairs
-- autopairs for neovim written by lua

local coc_cr = function()
	npairs.setup({ map_cr = false })
	local remap = vim.api.nvim_set_keymap
	local npairs = require("nvim-autopairs")
	npairs.setup({ map_cr = false })

	-- skip it, if you use another global object
	_G.MUtils = {}

	-- new version for custom pum
	MUtils.completion_confirm = function()
		if vim.fn["coc#pum#visible"]() ~= 0 then
			return vim.fn["coc#pum#confirm"]()
		else
			return npairs.autopairs_cr()
		end
	end

	remap("i", "<CR>", "v:lua.MUtils.completion_confirm()", { expr = true, noremap = true })
end

local function autopairs_cfg()
	local npairs = require("nvim-autopairs")
	local Rule = require("nvim-autopairs.rule")
	local cond = require("nvim-autopairs.conds")

	-- Mapping <CR>
	npairs.setup({ map_cr = true })
	-- coc_cr()

	-- Add space between parenthneses
	local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" }, { '"', '"' }, { "'", "'" } }
	npairs.add_rules({
		-- Rule for a pair with left-side ' ' and right side ' '
		Rule(" ", " ")
			-- Pair will only occur if the conditional function returns true
			:with_pair(function(opts)
				-- We are checking if we are inserting a space in (), [], or {}
				local pair = opts.line:sub(opts.col - 1, opts.col)
				return vim.tbl_contains({
					brackets[1][1] .. brackets[1][2],
					brackets[2][1] .. brackets[2][2],
					brackets[3][1] .. brackets[3][2],
					brackets[4][1] .. brackets[4][2],
					brackets[5][1] .. brackets[5][2],
				}, pair)
			end)
			:with_move(cond.none())
			:with_cr(cond.none())
			-- We only want to delete the pair of spaces when the cursor is as such: ( | )
			:with_del(function(opts)
				local col = vim.api.nvim_win_get_cursor(0)[2]
				local context = opts.line:sub(col - 1, col + 2)
				return vim.tbl_contains({
					brackets[1][1] .. "  " .. brackets[1][2],
					brackets[2][1] .. "  " .. brackets[2][2],
					brackets[3][1] .. "  " .. brackets[3][2],
					brackets[4][1] .. "  " .. brackets[4][2],
					brackets[5][1] .. brackets[5][2],
				}, context)
			end),
	})
	-- For each pair of brackets we will add another rule
	for _, bracket in pairs(brackets) do
		npairs.add_rules({
			-- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
			Rule(bracket[1] .. " ", " " .. bracket[2])
				:with_pair(cond.none())
				:with_move(function(opts)
					return opts.char == bracket[2]
				end)
				:with_del(cond.none())
				:use_key(bracket[2])
				-- Removes the trailing whitespace that can occur without this
				:replace_map_cr(function(_)
					return "<C-c>2xi<CR><C-c>O"
				end),
		})
	end
end

return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = autopairs_cfg,
}
