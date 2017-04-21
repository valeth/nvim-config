set readonly
set nomodifiable
set nolist
set nocursorcolumn
set colorcolumn=0

noremap q :q<CR>
noremap <SPACE> <C-D>
noremap b <C-U>
nnoremap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>
