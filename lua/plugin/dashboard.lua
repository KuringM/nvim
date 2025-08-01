-- https://github.com/goolord/alpha-nvim
-- a lua powered greeter like vim-startify / dashboard-nvim

local function cfg()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")
	-- Set header
	dashboard.section.header.val = {
		"                                                      ",
		"    ▄▄▄██▀▀▀▒█████ ▓██   ██▓ ▄▄▄▄    ▒█████ ▓██   ██▓ ",
		"      ▒██  ▒██▒  ██▒▒██  ██▒▓█████▄ ▒██▒  ██▒▒██  ██▒ ",
		"      ░██  ▒██░  ██▒ ▒██ ██░▒██▒ ▄██▒██░  ██▒ ▒██ ██░ ",
		"   ▓██▄██▓ ▒██   ██░ ░ ▐██▓░▒██░█▀  ▒██   ██░ ░ ▐██▓░ ",
		"    ▓███▒  ░ ████▓▒░ ░ ██▒▓░░▓█  ▀█▓░ ████▓▒░ ░ ██▒▓░ ",
		"    ▒▓▒▒░  ░ ▒░▒░▒░   ██▒▒▒ ░▒▓███▀▒░ ▒░▒░▒░   ██▒▒▒  ",
		"    ▒ ░▒░    ░ ▒ ▒░ ▓██ ░▒░ ▒░▒   ░   ░ ▒ ▒░ ▓██ ░▒░  ",
		"    ░ ░ ░  ░ ░ ░ ▒  ▒ ▒ ░░   ░    ░ ░ ░ ░ ▒  ▒ ▒ ░░   ",
		"    ░   ░      ░ ░  ░ ░      ░          ░ ░  ░ ░      ",
		"                    ░ ░           ░          ░ ░      ",
		"                                                      ",
	}

	-- Set button
	dashboard.section.buttons.val = {
		dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("f", "  > Find file", ":Telescope find_files <CR>"),
		dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
		dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
		dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
	}

	-- Set footer
	local lazy_stats = require("lazy").stats() -- Get Lazy.nvim stats
	dashboard.section.footer.val = {
		"If You Don't Take Risks, You Can't Create a Future.",
		" ",
		"                                  - Monkey D. Luffy",
		" ",
		"             Plugins loaded: " .. lazy_stats.loaded .. " / " .. lazy_stats.count,
	}

	-- Send config to alpha
	alpha.setup(dashboard.opts)

	-- Disable folding on alpha buffer
	vim.cmd([[
      autocmd FileType alpha setlocal nofoldenable
    ]])
end

return {
	"goolord/alpha-nvim",
	lazy = false,
	config = cfg,
}
