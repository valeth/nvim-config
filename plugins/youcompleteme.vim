if v:version >= 704
    Plug 'Valloric/YouCompleteMe', {'do': 'python2 install.py --clang-completer' }
endif

let g:ycm_global_ycm_extra_conf = g:vim_config_home . "/plugins/youcompleteme/ycm_extra_conf.py"

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_server_keep_logfile = 1
