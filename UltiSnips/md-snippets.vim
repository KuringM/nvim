"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
" find <++>
autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
" find <++> and press down Enter
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
" split line
autocmd Filetype markdown inoremap <buffer> ,n ---<Enter>
" bold
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
" delete line
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
" italic
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
" underline
autocmd Filetype markdown inoremap <buffer> ,u <u></u> <++><Esc>F<;i
" code block
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
" big code block
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
" bill
autocmd Filetype markdown inoremap <buffer> ,m - [ ] 
" photo
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
" link
autocmd Filetype markdown inoremap <buffer> ,l [](<++>) <++><Esc>F[a
" 1st title 
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
" 2nd title 
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
" 3rd title 
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
" 4th title 
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
" 5th title 
autocmd Filetype markdown inoremap <buffer> ,5 #####<Space><Enter><++><Esc>kA
" 6th title 
autocmd Filetype markdown inoremap <buffer> ,6 ######<Space><Enter><++><Esc>kA
" color text
autocmd Filetype markdown inoremap <buffer> ,ct <font color=green><++></font>
" new line
autocmd FileType markdown inoremap <buffer> ,a <BR><Enter>
" space format
autocmd Filetype markdown inoremap <buffer> ,nb &nbsp;
autocmd Filetype markdown inoremap <buffer> ,nbb &nbsp;&nbsp;
autocmd Filetype markdown inoremap <buffer> ,en &ensp;
autocmd Filetype markdown inoremap <buffer> ,enn &ensp;&ensp;
autocmd Filetype markdown inoremap <buffer> ,em &emsp;
autocmd Filetype markdown inoremap <buffer> ,emm &emsp;&emsp;
" A collapsible section containing markdown
autocmd FileType markdown inoremap <buffer> ,ex <details><NL><Space><Space><summary><++></summary><NL><NL><BS><++><NL></details><NL><NL><++>
" table
autocmd FileType markdown inoremap <buffer> ,t \|<++>\|<++>\|<NL>\|:--:\|:--:\|<NL>\|<++>\|<++>\|<NL><NL><++><Esc>A
