"set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set shiftround

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
