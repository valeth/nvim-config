aug CursorLineColumn
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
    "au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
    "au VimEnter,WinEnter,BufWinEnter * setlocal colorcolumn=80
    au WinLeave * setlocal nocursorline nocursorcolumn colorcolumn=0
aug END
