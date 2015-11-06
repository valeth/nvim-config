if ! has('nvim')
    " default options in neovim
    set autoindent
    set autoread
    set backspace=indent,eol,start
    set complete-=i
    set display=lastline
    "if has('multi_byte')
        "set encoding=utf-8
    "endif
    if v:version >= 704
        set formatoptions=tcqj
    endif
    if &history < 10000
        set history=10000
    endif
    if has('extra_search')
        set hlsearch
        set incsearch
    endif
    if has('langmap')
        set langnoremap
    endif
    set laststatus=2
    set listchars="tab:> ,trail:-,nbsp:+"
    if has('mouse')
        set mouse=a
    endif
    "set nocompatible
    set nrformats=hex
    if has('mksession')
        set sessionoptions+=options
    endif
    set smarttab
    if has('windows')
        set tabpagemax=50
    endif
    set tags="./tags;,tags"
    set ttyfast
    if has('viminfo')
        set viminfo+=!
    endif
    if has('wildmenu')
        set wildmenu
    endif

    " options that have been removed from neovim
    if v:version >= 704 
        set cryptmethod=blowfish

        au BufReadPost * if &key != "" | set noswapfile nowritebackup viminfo= nobackup noshelltemp history=0 secure | endif
    endif
endif
