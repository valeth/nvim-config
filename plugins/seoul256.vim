"  _____             _ ___ ___ ___      "
" |   __|___ ___ _ _| |_  |  _|  _|     "
" |__   | -_| . | | | |  _|_  | . |     "
" |_____|___|___|___|_|___|___|___|.vim "
"
"   seoul256.vim is a low-contrast Vim color scheme based on Seoul Colors.
"   Works on 256-color terminal or on GVim
"   by Junegunn Choi (https://github.com/junegunn/seoul256.vim)
"
"   Theme           Range       Default
"   -----           -----       -------
"   seoul256        233 - 239   237
"   seoul256-light  252 - 256   253

Plug 'junegunn/seoul256.vim'

let g:seoul256_background       = 237
let g:seoul256_light_background = 254

function! ToggleSeoul256()
    if g:colors_name == 'seoul256'
        colorscheme seoul256-light
    else
        colorscheme seoul256
    endif
endfunction

