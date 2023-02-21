" ====== Auto load for first time uses ======
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ====== Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location ======
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/autoload/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
source $HOME/.config/nvim/_machine_specific.vim

" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif

" ===================== Loading Some UltiSnips =====================
" Snippets
source $HOME/.config/nvim/UltiSnips/md-snippets.vim
source $HOME/.config/nvim/UltiSnips/tex-snippets.vim

" Scripts
source $HOME/.config/nvim/scripts/Rcompile.vim
source $HOME/.config/nvim/scripts/TurnCP2EP.vim

" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell

" ===================== Ending Work =====================
exec "nohlsearch"
