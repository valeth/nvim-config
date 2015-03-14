if v:version >= 704
    set cryptmethod=blowfish

    au BufReadPost * if &key != "" | set noswapfile nowritebackup viminfo= nobackup noshelltemp history=0 secure | endif
endif
