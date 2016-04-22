Plug 'chriskempson/tomorrow-theme'

function! ToggleTomorrow()
    if g:colors_name == 'Tomorrow-Night'
        colorscheme Tomorrow
    else
        colorscheme Tomorrow-Night
    endif
endfunction

