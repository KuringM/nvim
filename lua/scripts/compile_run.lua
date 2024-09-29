local split = function()
	vim.cmd("set splitbelow")
	vim.cmd("sp")
	vim.cmd("res -5")
end
local compileRun = function()
	vim.cmd("w")
	-- check file type
	local ft = vim.bo.filetype
	if ft == "dart" then
		vim.cmd(":FlutterRun -d " .. vim.g.flutter_default_device .. " " .. vim.g.flutter_run_args)
	elseif ft == "markdown" then
		-- vim.cmd(":InstantMarkdownPreview")
		vim.cmd(":MarkdownPreview")
	elseif ft == "c" then
		split()
		vim.cmd("term gcc % -o %< && ./%< && rm %<")
	elseif ft == "javascript" then
		split()
		vim.cmd("term node %")
	elseif ft == "lua" then
		split()
		vim.cmd("term luajit %")
	elseif ft == "cpp" then
		vim.cmd([[
			set splitbelow
			exec "!g++ -std=c++11 % -Wall -o %<"
			:sp
			:res -15
			:term ./%<
		]])
	elseif ft == "java" then
		vim.cmd([[
			exec "!javac %"
			exec "!time java %<"
		]])
	elseif ft == "sh" then
		split()
		vim.cmd("term zsh %")
	elseif ft == "python" then
		vim.cmd([[
			set splitbelow
			:sp
			:term python3 %
		]])
	elseif ft == "html" then
		vim.cmd([[
			silent! exec "!".g:mkdp_browser." % &"
		]])
	elseif ft == "tex" then
		vim.cmd([[
			silent! exec "VimtexStop"
			silent! exec "VimtexCompile"
		]])
	elseif ft == "go" then
		vim.cmd([[
			set splitbelow
			:sp
			:term go run .
		]])
	elseif extension == "ms" then
		vim.cmd([[
			execute "! ps -ef | grep \"zathura /tmp/op.pdf\" | grep -v grep | cut -c 9-16 | xargs kill -s 9"
			execute "! groff -ms % -Tpdf > /tmp/op.pdf "
			execute "! zathura /tmp/op.pdf &"
		elseif extension == 'mom'
			execute "! ps -ef | grep \"zathura /tmp/op.pdf\" | grep -v grep | cut -c 9-16 | xargs kill -s 9"
			execute "! groff -mom % -Tpdf > /tmp/op.pdf "
			execute "! zathura /tmp/op.pdf &"
		]])
	elseif extension == "me" then
		vim.cmd([[
			execute "! tbl % | groff -me -Tpdf | zathura -"
		]])
	end
end

vim.keymap.set("n", "r", compileRun, { silent = true })
