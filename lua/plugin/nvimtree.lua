local config = {}

local map = vim.keymap.set

config.nvimtree = {
	"nvim-tree/nvim-tree.lua",
	cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
	init = function()
		map("n", "tt", ":NvimTreeFindFile<CR>", { silent = true })
	end,
	config = function()
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- optionally enable 24-bit colour
		vim.opt.termguicolors = true
		require("nvim-tree").setup({
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, silent = true, nowait = true }
				end

				-- default mappings
				-- api.config.mappings.default_on_attach(bufnr)
				--
				local function smart_edit_or_cd()
					local node = api.tree.get_node_under_cursor()
					if not node then
						return
					end

					if node.type == "directory" then
						api.tree.change_root_to_node()
					elseif node.type == "file" then
						api.node.open.edit()
					end
				end

				-- 文件打开操作
				map("n", "i", smart_edit_or_cd, opts("Open"))
				map("n", "I", api.node.open.vertical, opts("Open in vertical split"))
				map("n", "O", api.node.open.tab, opts("Open in new tab"))
				map("n", "o", api.node.open.edit, opts("Open"))
				map("n", "<CR>", api.node.open.edit, opts("Open"))
				map("n", "<Tab>", api.node.show_info_popup, opts("Action Menu (info)"))
				-- map("n", "tt", api.node.tree.toggle, opts("Action Menu (info)"))

				-- 节点展开/折叠
				map("n", "h", api.node.navigate.parent_close, opts("Collapse Node"))
				map("n", "gh", api.tree.collapse_all, opts("Collapse All"))
				map("n", "gl", api.tree.expand_all, opts("Expand Recursive")) -- 同上

				-- 节点跳转(近似替代)
				map("n", "e", api.node.navigate.sibling.next, opts("Next Sibling"))
				-- map("n", "E", api.node.navigate.sibling.last, opts("Last Sibling"))
				map("n", "u", api.node.navigate.sibling.prev, opts("Prev Sibling"))
				map("n", "U", api.node.navigate.sibling.first, opts("First Sibling"))
				map("n", "n", api.node.navigate.parent, opts("Go to Parent"))

				-- 文件系统操作
				map("n", "a", api.fs.create, opts("Add File"))
				map("n", "k", api.fs.create, opts("Add File")) -- 重复
				map("n", "M", api.fs.create, opts("Add Directory")) -- 不能区分文件夹, 除非配置 create 的路径
				map("n", "cw", api.fs.rename, opts("Rename"))
				map("n", "dD", api.fs.remove, opts("Delete Forever")) -- 没有回收站
				map("n", "dd", api.fs.cut, opts("Cut File"))
				map("n", "yy", api.fs.copy.node, opts("Copy File"))
				map("n", "pp", api.fs.paste, opts("Paste File"))

				-- 路径复制
				map("n", "yp", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
				map("n", "yn", api.fs.copy.filename, opts("Copy Filename"))

				-- 显示/隐藏
				map("n", ".", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
				map("n", "zh", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))

				-- Git 操作(近似替代)
				map("n", "<<", api.node.run.cmd, opts("Git Stage")) -- ❗需要你写自定义命令实现 stage
				map("n", ">>", api.node.run.cmd, opts("Git Unstage")) -- 同上
				map("n", "[c", api.node.navigate.git.prev, opts("Git Prev"))
				map("n", "]c", api.node.navigate.git.next, opts("Git Next"))

				-- Diagnostic(❗nvim-tree 不支持内建诊断跳转, 可映射外部命令)
				map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts("Diagnostic Prev"))
				map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts("Diagnostic Next"))

				-- 其它操作
				map("n", "R", api.tree.reload, opts("Refresh"))
				map("n", "?", api.tree.toggle_help, opts("Help"))
				map("n", "q", api.tree.close, opts("Quit"))
				map("n", "X", api.node.run.system, opts("System Execute")) -- 打开系统应用(如默认编辑器)

				-- 不支持或无对应:
				-- "gd" = "listDrive"       -> 无法列出磁盘根目录
				-- "B", "b", "[[", "]]"     -> nvim-tree 无 source 机制, 请用 bufferline/tabline 替代
				-- "f", "F"                 -> nvim-tree 无内建 fuzzy search, 推荐 :Telescope find_files 替代
			end,
		})
	end,
}

return {
	config.nvimtree,
}
