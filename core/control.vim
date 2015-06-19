nnoremap Y y$
nnoremap j gj
nnoremap k gk

inoremap jk <ESC>
inoremap JK <ESC>
inoremap Jk <ESC>

set ttimeout
set timeoutlen=500

nnoremap <F1> <NOP>
inoremap <F1> <NOP>

let g:mapleader = ","

noremap <silent> <Leader><CR> :noh<CR>
nnoremap <Leader>vl :setlocal cursorline!<CR>
nnoremap <Leader>vc :setlocal cursorcolumn!<CR>
nnoremap <Leader>ve :setlocal colorcolumn=80<CR>
nnoremap <Leader>vn :setlocal colorcolumn=0<CR>

" enable mouse support
if has('mouse')
	set mouse=a
endif

" some useful backspace settings
set backspace=indent,eol,start

" change the current directory to the one containing the current file
if has('autochdir')
	set autochdir
endif

" octal is not really that important
set nrformats-=octal

set confirm
