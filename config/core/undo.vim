nnoremap U :redo<CR>
nnoremap <C-R> <NOP>

if v:version >= 704
    set undofile
    set undolevels=1000
endif
