"aug LineNumbers
    "au!
    "au VimEnter,WinEnter,InsertLeave * setlocal relativenumber
    "au WinLeave,InsertEnter * setlocal norelativenumber
"aug END

aug CursorLineColumn
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
    "au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
    "au VimEnter,WinEnter,BufWinEnter * setlocal colorcolumn=80
    au WinLeave * setlocal nocursorline nocursorcolumn colorcolumn=0
aug END

aug FastEscape
    au!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
aug END

aug ReadonlyFiles
    au BufNewFile,BufRead /var/log/* set readonly
    au BufNewFile,BufRead /var/log/* set nomodifiable
aug END
