nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<CR>
nnoremap tq :tabclose<CR>

" increase the maximal number of tabpages (default 10)
if &tabpagemax < 50
	set tabpagemax=50
endif
