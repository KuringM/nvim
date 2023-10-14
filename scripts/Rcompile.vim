" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	let extension = expand('%:e')
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif extension == 'md'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	elseif &filetype == 'lua'
		set splitbelow
		:sp
		:term lua %:t
	elseif extension == 'ms'
		execute "! ps -ef | grep \"zathura /tmp/op.pdf\" | grep -v grep | cut -c 9-16 | xargs kill -s 9"
		execute "! groff -ms % -Tpdf > /tmp/op.pdf "
		execute "! zathura /tmp/op.pdf &"
	elseif extension == 'mom'
		execute "! ps -ef | grep \"zathura /tmp/op.pdf\" | grep -v grep | cut -c 9-16 | xargs kill -s 9"
		execute "! groff -mom % -Tpdf > /tmp/op.pdf "
		execute "! zathura /tmp/op.pdf &"
	elseif extension == 'me'
		execute "! tbl % | groff -me -Tpdf | zathura -"
	endif
endfunc
