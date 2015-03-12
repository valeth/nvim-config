"
" this only gets executed if not using the own vim installation
"

function! CheckXDGVars()
    if empty($XDG_CONFIG_HOME)
        let $vim_config_home=expand("$HOME/.config/vim")
    else
        let $vim_config_home=expand("$XDG_CONFIG_HOME/vim")
    endif

    if empty($XDG_CACHE_HOME)
        let $vim_cache_home=expand("$HOME/.local/cache/vim")
    else
        let $vim_cache_home=expand("$XDG_CACHE_HOME/vim")
    endif

    if empty($XDG_DATA_HOME)
        let $vim_data_home=expand("$HOME/.local/share/vim")
    else
        let $vim_data_home=expand("$XDG_DATA_HOME/vim")
    endif
endfunction

function! SetUserRuntimePath(dir)
    let $user_rtp=a:dir
    let $runtimepath_old=&runtimepath
    set runtimepath=$user_rtp,$user_rtp/after,$runtimepath_old
endfunction

function! SetUserBackupdir(dir)
    let &backupdir=a:dir . "/backup"
    if !isdirectory(expand(&backupdir))
        call mkdir(expand(&backupdir), "p", 0700)
    endif
endfunction

function! SetUserSwapdir(dir)
    let &directory=a:dir . "/swap"
    if !isdirectory(expand(&directory))
        call mkdir(expand(&directory), "p", 0700)
    endif
endfunction

function! SetUserViewdir(dir)
    if has('mksession')
        let &viewdir=a:dir . "/views"
        if !isdirectory(expand(&viewdir))
            call mkdir(expand(&viewdir), "p", 0700)
        endif
    endif
endfunction

function! SetUserUndodir(dir)
    if has('persistent_undo')
        let &undodir=a:dir . "/undo"
        if !isdirectory(expand(&undodir))
            call mkdir(expand(&undodir), "p", 0700)
        endif
    endif
endfunction

function! SetUserViminfo(dir)
    if has('viminfo')
        if !isdirectory(a:dir)
            call mkdir(a:dir, "p", 0700)
        endif
        set nocompatible
        let &viminfo="'1000,<50,s10,n" . a:dir . "/viminfo"
    endif
endfunction

function! SetOptions()
    set autoindent
    set backspace=indent,eol,start
    set complete-=i
    set smarttab
    set nrformats-=octal
    set shiftround
    set ttimeout
    set ttimeoutlen=100
    set laststatus=2
    set number
    set autoread " does it even work?
    set fileformats=unix,dos,mac
    set display+=lastline
    set noerrorbells
    set visualbell
    set t_vb=
    set showmatch

    "#################################
    "# Options depending on features #
    "#################################

    " allow the cursor to be positioned where no characters are in virtual block mode 
    if has('virtualedit')
        set virtualedit=block
    endif

    " split the windows more 'naturally'
    if has('windows')
        set splitbelow
        set splitright
    endif

    " enable filetype plugins
    if has('autocmd')
        filetype plugin indent on
    endif

    " enable syntax highlighting
    if has('syntax')
        syntax enable
    endif

    " highlight searches and search while typing
    if has('extra_search')
        set hlsearch
        set incsearch
        if maparg('<C-L>', 'n') ==# ''
            nnoremap <silent><C-L> :nohlsearch<CR><C-L>
        endif
    endif

    " show a ruler and show the current command in the bottom right
    if has('cmdline_info')
        set ruler
        set showcmd
    endif

    if has('wildmenu')
        set wildmenu
    endif

    if has('multi_byte')
        set encoding=utf-8
        set termencoding=utf-8
    endif

    " enable mouse support
    if has('mouse')
        set mouse=a
    endif


    "######################################
    "# Options depending on set variables #
    "######################################

    " set scroll offset slightly higher so that the next or previous line can be seen
    if !&scrolloff
        set scrolloff=1
    endif

    " same as with scroll offset but for horizontal scrolling
    if !&sidescrolloff
        set sidescrolloff=5
    endif

    " set the history far higher (default 50)
    if &history < 1000
        set history=1000
    endif

    " increase the maximal number of tabpages (default 10)
    if &tabpagemax < 50
        set tabpagemax=50
    endif

    " set the terminal colors to 256 if not in a VT
    if exists($TERM)
        if &t_Co == 8 && $TERM !~# '^linux'
            set t_Co=256
        endif
    endif

    "#################
    "# Plugins, etc. #
    "#################

    " load the matchit macros
    if !exists('g:loaded_matchit') && findfile('plugins/matchit.vim', &rtp) ==# ''
        runtime! macros/matchit.vim
    endif
endfunction

if empty($my_vim)
    call CheckXDGVars()
    call SetUserRuntimePath($vim_config_home)
    call SetUserSwapdir($vim_data_home)
    call SetUserUndodir($vim_data_home)
    call SetUserViewdir($vim_data_home)
    call SetUserBackupdir($vim_data_home)
    call SetUserViminfo($vim_cache_home)
    call SetOptions()
endif " empty($my_vim)
