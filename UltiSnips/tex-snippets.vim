autocmd Filetype markdown inoremap <buffer> ,zhu $\textcolor{red}{注}$ 
autocmd Filetype markdown inoremap <buffer> ,tc $\textcolor{green}{<++>}$ 
autocmd Filetype markdown inoremap <buffer> ,kh $$<++>\left\{\begin{array}{ll}<Enter><++><Enter>\end{array}\right.$$
autocmd Filetype markdown inoremap <buffer> ,lim  $\lim $ <++><Esc>F$i
autocmd Filetype markdown inoremap <buffer> ,limm  $\lim\limits_{<++>\to <++>}<++>$
autocmd Filetype markdown inoremap <buffer> ,dq $$\begin{aligned}<Enter>&<Enter>\end{aligned}$$<Enter><Enter><++><Esc>3ka
autocmd Filetype markdown inoremap <buffer> ,int  $\int $ <++><Esc>F$i
autocmd Filetype markdown inoremap <buffer> ,intt  $\int_{<++>}^{<++>}mathrm{d}<++>$ <++>

autocmd Filetype markdown inoremap <buffer> ,hs $f(x)$
autocmd Filetype markdown inoremap <buffer> ,ds $f'(x)$
autocmd Filetype markdown inoremap <buffer> ,x $x_0$
autocmd FileType markdown inoremap <buffer> ,sl $\{x_n\}$
autocmd Filetype markdown inoremap <buffer> ,uu $\mathring{U}(x_0,\delta)$
