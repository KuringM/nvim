" please read through this file and change what you need to change
let g:snips_author = 'Kuring'

" Python
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

" Ruby
let g:ruby_host_prog = '/usr/bin/ruby'

" Flutter
let g:flutter_default_device = 'iPhone'
let g:flutter_run_args = "--flavor dev"

" App variable 
let g:mkdp_browser = 'google-chrome-stable'

" command open Google Chrome on mac
function! g:Open_browser(url)
    silent exe 'silent !open -a "Google Chrome" ' . a:url
endfunction
let g:mkdp_browserfunc = 'g:Open_browser'
