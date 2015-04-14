au bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

noremap  <silent> <F3> :NERDTreeToggle<CR>
inoremap <silent> <F3> <C-O>:NERDTreeToggle<CR>
vnoremap <silent> <F3> <ESC>:NERDTreeToggle<CR>
