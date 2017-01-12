"augroup LineReturn
"    au!
"    au BufReadPost *
"        \ if line("'\"") > 0 && line("'\"") <= line("$") |
"        \     execute 'normal! g`"zvzz' |
"        \ endif
"augroup END

augroup ToggleLineNumbers
    au!
    au VimEnter,WinEnter,InsertLeave * setlocal relativenumber
    au WinLeave,InsertEnter * setlocal norelativenumber
augroup END

augroup CursorHighlight
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
    "au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
    "au WinLeave * setlocal nocursorcolumn
    au VimEnter,WinEnter,BufWinEnter * setlocal colorcolumn=+3
    au WinLeave * setlocal colorcolumn=0
augroup END

" save automatically
autocmd FocusLost * :silent! wa

" keep splits equal on terminal resize
autocmd VimResized * :wincmd =

" remove trailing whitespace
" autocmd BufWritePre * %s/\s\+$//e
