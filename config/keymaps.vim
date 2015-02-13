nnoremap <F1> <NOP>
inoremap <F1> <NOP>

nnoremap <silent> <F4> :set invlist<CR>
inoremap <silent> <F4> <C-O>:set invlist<CR>
vnoremap <silent> <F4> :<C-W>set invlist<CR>

nnoremap Q <NOP>
nnoremap K <NOP>
nnoremap Y y$
nnoremap j gj
nnoremap k gk
vnoremap < <gv
vnoremap > >gv

nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<CR>
nnoremap tq :tabclose<CR>

noremap <silent> <Leader><CR> :noh<CR>

nnoremap <Leader>vl :setlocal cursorline!<CR>
nnoremap <Leader>vc :setlocal cursorcolumn!<CR>
nnoremap <Leader>ve :setlocal colorcolumn=80<CR>
nnoremap <Leader>vn :setlocal colorcolumn=0<CR>
