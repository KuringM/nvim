" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @Kuring

" ~/.config/nvim/conf/autoload.vim
" ~/.config/nvim/conf/option.vim
" ~/.config/nvim/conf/mappings.vim
" ~/.config/nvim/conf/plugin.vim

" loading my nvim config
let s:conf_files = [
			\ 'autoload.vim',
			\ 'option.vim',
			\ 'mappings.vim',
			\ 'plugin.vim'
			\]

for s:fname in s:conf_files
	execute printf('source %s/conf/%s', stdpath('config'), s:fname)
endfor
