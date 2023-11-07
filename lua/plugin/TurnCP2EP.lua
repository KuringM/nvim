-- Chinese Punctuation turn to English Punctuation
local CheckChineseMark = function()
	if vim.ft.search("。") then
		vim.cmd([[
			let s:line=search('。')
			execute s:line . "s/。/\. /g"
		]])
	elseif vim.ft.search("，") then
		vim.cmd([[
			let s:line=search('，')
			execute s:line . "s/，/, /g"
		]])
	elseif vim.ft.search("；") then
		vim.cmd([[
			let s:line=search('；')
			execute s:line . "s/；/;/g"
		]])
	elseif vim.ft.search("？") then
		vim.cmd([[
			let s:line=search('？')
			execute s:line . "s/？/?/g"
		]])
	elseif vim.ft.search("：") then
		vim.cmd([[
			let s:line=search('：')
			execute s:line . "s/：/\:/g"
		]])
	elseif vim.ft.search("‘") then
		vim.cmd([[
			let s:line=search('‘')
			execute s:line . "s/‘/\'/g"
		]])
	elseif vim.ft.search("’") then
		vim.cmd([[
			let s:line=search('’')
			execute s:line . "s/’/\'/g"
		]])
	elseif vim.ft.search("”") then
		vim.cmd([[
			let s:line=search('”')
			execute s:line . "s/”/\"/g"
		]])
	elseif vim.ft.search("“") then
		vim.cmd([[
			let s:line=search('“')
			execute s:line . "s/“/\"/g"
		]])
	elseif vim.ft.search("《") then
		vim.cmd([[
			let s:line=search('《')
			execute s:line . "s/《/\</g"
		]])
	elseif vim.ft.search("》") then
		vim.cmd([[
			let s:linie=search('》')
			execute s:line . "s/》/\>/g"
		]])
	elseif vim.ft.search("——") then
		vim.cmd([[
			let s:line=search('——')
		execute s:line . "s/——/-/g"
		]])
	elseif vim.ft.search("）") then
		vim.cmd([[
			let s:line=search('）')
			execute s:line . "s/）/\)/g"
		]])
	elseif vim.ft.search("（") then
		vim.cmd([[
			let s:line=search('（')
			execute s:line . "s/（/\(/g"
		]])
	elseif vim.ft.search("……") then
		vim.cmd([[
			let s:line=search('……')
			execute s:line . "s/……/^/g"
		]])
	elseif vim.ft.search("¥") then
		vim.cmd([[
			let s:line=search('¥')
			execute s:line . "s/¥/$/g"
		]])
	elseif vim.ft.search("！") then
		vim.cmd([[
			let s:line=search('！')
			execute s:line . "s/！/!/g"
		]])
	elseif vim.ft.search("·") then
		vim.cmd([[
			let s:line=search('·')
			execute s:line . "s/·/`/g"
		]])
	elseif vim.ft.search("【") then
		vim.cmd([[
			let s:line=search('【')
			execute s:line . "s/【/[/g"
		]])
	elseif vim.ft.search("】") then
		vim.cmd([[
			let s:line=search('】')
			execute s:line . "s/】/]/g"
		]])
	end
end

vim.keymap.set("n", "<C-s>" ,":call CheckChineseMark()<CR>", { noremap = true})
vim.keymap.set("i", "<C-s>" ,"<ESC>:call CheckChineseMark()<CR>", { noremap = true})
