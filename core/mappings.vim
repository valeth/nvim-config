let g:mapleader = ","

command! Wq wq
command! WQ wq
command! Q q
command! W w

nnoremap U :redo<CR>
nnoremap <C-R> <NOP>

" allow explicit writing of read-only files with sudo
cnoremap sudow w !sudo tee % >/dev/null

" unset search highlighting
noremap <silent> <Leader><CR> :noh<CR>

nnoremap <Leader>vl :setlocal cursorline!<CR>
nnoremap <Leader>vc :setlocal cursorcolumn!<CR>
nnoremap <Leader>ve :setlocal colorcolumn=80<CR>
nnoremap <Leader>vn :setlocal colorcolumn=0<CR>

nnoremap Y y$
nnoremap j gj
nnoremap k gk

" unset default help shortcut
nnoremap <F1> <NOP>
inoremap <F1> <NOP>

inoremap jk <ESC>
inoremap JK <ESC>
inoremap Jk <ESC>

vnoremap < <gv
vnoremap > >gv

" fix indentation of an entire file
nnoremap <leader>fmt gg=G<CR>``

" local replace
nnoremap gr gd[{V%::s/<C-R>///g<left><left>
nnoremap gR gD:%s/<C-R>///g<left><left>

if v:progname == 'nvim'
	tnoremap <ESC> <C-\><C-n>
endif

" highlight searches and search while typing
if has('extra_search')
	if maparg('<C-L>', 'n') ==# ''
		nnoremap <silent><C-L> :nohlsearch<CR><C-L>
	endif
endif

nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<CR>
nnoremap tq :tabclose<CR>

nnoremap <silent> <leader>il :set invlist<CR>
vnoremap <silent> <leader>il :<C-W>set invlist<CR>
