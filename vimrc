"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                             "
"   Maintainer:   Patrick Auernig <patrick DOT auernig AT gmail DOT com>      "
"   VIM Version:  7.4                                                         "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""
" Core: XDG Directories "
"""""""""""""""""""""""""

if exists('$XDG_CONFIG_HOME')
        let g:vim_config_home = expand('$XDG_CONFIG_HOME/') . v:progname
else
        let g:vim_config_home = expand('$HOME/.config/') . v:progname
endif

if !isdirectory(g:vim_config_home)
        call mkdir( g:vim_config_home, 'p', 0700 )
endif

if exists('$XDG_CACHE_HOME')
        let g:vim_cache_home = expand('$XDG_CACHE_HOME/') . v:progname
else
        let g:vim_cache_home = expand('$HOME/.local/cache/') . v:progname
endif

if !isdirectory(g:vim_cache_home)
        call mkdir( g:vim_cache_home, 'p', 0700 )
endif

if exists('$XDG_DATA_HOME')
        let g:vim_data_home = expand('$XDG_DATA_HOME/') . v:progname
else
        let g:vim_data_home = expand('$HOME/.local/share/') . v:progname
endif

if !isdirectory(g:vim_data_home)
        call mkdir( g:vim_data_home, 'p', 0700 )
endif

let g:user_rtp = g:vim_config_home
let g:runtimepath_old = &runtimepath
let &runtimepath .= ',' . expand(g:user_rtp)
let &runtimepath .= ',' . expand(g:user_rtp) . '/after'
let &runtimepath .= ',' . expand(g:runtimepath_old)

" reload config
augroup myvimrc
    au!
    au BufWritePost $MYVIMRC source $MYVIMRC
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""
" Compat: Just for compatability with legacy vim "
""""""""""""""""""""""""""""""""""""""""""""""""""

set ttimeoutlen=-1

" default options in neovim
set autoindent
set autoread
set backspace=indent,eol,start
set complete-=i
set display=lastline
"if has('multi_byte')
"   set encoding=utf-8
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


if has('mksession')
        let &viewdir = g:vim_data_home . '/views'
        if !isdirectory(expand(&viewdir))
                call mkdir(expand(&viewdir), 'p', 0700)
        endif
endif


if has('persistent_undo')
        let &undodir = g:vim_data_home . '/undo'
        if !isdirectory(expand(&undodir))
                call mkdir(expand(&undodir), 'p', 0700)
        endif
endif


if has('viminfo')
        set nocompatible
        let &viminfo = "'1000,<50,s10,n" . g:vim_cache_home . '/viminfo'
endif

" source additional config files
runtime! core/**/*.vim
runtime! plugins/**/*.vim
