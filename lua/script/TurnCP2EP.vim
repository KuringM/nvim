" Chinese Punctuation turn to English Punctuation
noremap <C-s> :call CheckChineseMark()<CR>
inoremap <C-s> <ESC>:call CheckChineseMark()<CR>A
function! CheckChineseMark()
	if search('。')
		let s:line=search('。')
		execute s:line . "s/。/\. /g"
	endif

	if search('．')
		let s:line=search('．')
		execute s:line . "s/．/\. /g"
	endif

	if search('，')
		let s:line=search('，')
		execute s:line . "s/，/, /g"
	endif

	if search('；')
		let s:line=search('；')
		execute s:line . "s/；/;/g"
	endif
 
	if  search('？')
		let s:line=search('？')
		execute s:line . "s/？/?/g"
	endif

	if search('：')
		let s:line=search('：')
		execute s:line . "s/：/\:/g"
	endif

	if search('‘')
		let s:line=search('‘')
		execute s:line . "s/‘/\'/g"
	endif

	if search('’')
		let s:line=search('’')
		execute s:line . "s/’/\'/g"
	endif

	if search('”')
		let s:line=search('”')
		execute s:line . "s/”/\"/g"
	endif

	if search('“')
		let s:line=search('“')
		execute s:line . "s/“/\"/g"
	endif

	if search('《')
		let s:line=search('《')
		execute s:line . "s/《/\</g"
	endif

	if search('》')
		let s:linie=search('》')
		execute s:line . "s/》/\>/g"
	endif

	if search('——')
		let s:line=search('——')
		execute s:line . "s/——/-/g"
	endif

	if search('）')
		let s:line=search('）')
		execute s:line . "s/）/\)/g"
	endif

	if search('（')
		let s:line=search('（')
		execute s:line . "s/（/\(/g"
	endif

	if search('……')
		let s:line=search('……')
		execute s:line . "s/……/^/g"
	endif

	if search('¥')
		let s:line=search('¥')
		execute s:line . "s/¥/$/g"
	endif

	if search('！')
		let s:line=search('！')
		execute s:line . "s/！/!/g"
	endif

	if  search('·')
		let s:line=search('·')
		execute s:line . "s/·/`/g"
	endif

	if  search('【')
		let s:line=search('【')
		execute s:line . "s/【/[/g"
	endif

	if  search('】')
		let s:line=search('】')
		execute s:line . "s/】/]/g"
	endif
endfunction
