" Environment
autocmd Filetype markdown inoremap <buffer> \kh <++>\left\{\begin{array}{ll}<Enter><++><Enter>\end{array}\right.
autocmd Filetype markdown inoremap <buffer> \ba $$\begin{aligned}<Enter>& <Enter>\end{aligned}$$<Enter><Enter><++><Esc>3ka
autocmd FileType markdown inoremap <buffer> \bc \begin{cases}<Enter>& <Enter>\end{cases} <Esc>1ka
autocmd FileType markdown inoremap <buffer> \bm \begin{matrix}<Enter><Enter>\end{matrix} <Esc>1ka
autocmd FileType markdown inoremap <buffer> \bpm \begin{pmatrix}<Enter><Enter>\end{pmatrix} <Esc>1ka
autocmd FileType markdown inoremap <buffer> \bbm \begin{bmatrix}<Enter><Enter>\end{bmatrix} <Esc>1ka
autocmd FileType markdown inoremap <buffer> \bvm \begin{vmatrix}<Enter><Enter>\end{vmatrix} <Esc>1ka

" Operators
autocmd FileType markdown inoremap <buffer> \sq \sqrt[]{} <Esc>F{a
autocmd FileType markdown inoremap <buffer> \fr \frac{}{<++>} <Esc>2F{a
autocmd Filetype markdown inoremap <buffer> \limm \lim\limits_{<++>\to <++>}
autocmd Filetype markdown inoremap <buffer> \intt \int_{<++>}^{<++>}mathrm{d}
autocmd FileType markdown inoremap <buffer> \summ \sum\limits_{<++>}^{<++>}
autocmd FileType markdown inoremap <buffer> \prodd \prod\limits_{<++>}^{<++>}

" Unicode
autocmd FileType markdown inoremap <buffer> \al \alpha
autocmd FileType markdown inoremap <buffer> \be \beta
autocmd FileType markdown inoremap <buffer> \ga \gamma
autocmd FileType markdown inoremap <buffer> \lam \lambda
autocmd FileType markdown inoremap <buffer> \ep \epsilon

" Arrows
autocmd FileType markdown inoremap <buffer> \lra \Leftrightarrow 
autocmd FileType markdown inoremap <buffer> \ra \Rightarrow 
autocmd FileType markdown inoremap <buffer> \la \Leftarrow 

" Misc
autocmd Filetype markdown inoremap <buffer> ,zhu $\textcolor{red}{注}$ 
autocmd Filetype markdown inoremap <buffer> \tc \textcolor{green}{} <Esc>F}i
autocmd FileType markdown inoremap <buffer> \cb \colorbox{#FEFDD3}{\textcolor{black}{}} <Esc>2F}i
autocmd FileType markdown inoremap <buffer> \tb \textbf{} <Esc>F}i
autocmd Filetype markdown inoremap <buffer> \hs $f(x)$
autocmd Filetype markdown inoremap <buffer> \ds $f'(x)$
autocmd Filetype markdown inoremap <buffer> ,x $x_0$
autocmd FileType markdown inoremap <buffer> \sl $\{x_n\}$
autocmd Filetype markdown inoremap <buffer> \uu $\mathring{U}(x_0,\delta)$
