let g:gundo_width = 60
let g:gundo_preview_height = 30
let g:gundo_right = 1

nnoremap <silent> <F11> :GundoToggle<CR>
inoremap <silent> <F11> <C-O>:GundoToggle<CR>
vnoremap <silent> <F11> <ESC>:GundoToggle<CR>
