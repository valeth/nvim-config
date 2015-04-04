"########################################################################
"# Maintainer:   Patrick Auernig <patrick DOT auernig AT gmail DOT com> #
"# VIM Version:  7.4                                                    #
"########################################################################

if exists('g:my_vim')
    finish
endif

let g:my_vim=1


"###################################
"# XDG config and data directories #
"###################################

function! CheckXDGVars()
    if exists( "$XDG_CONFIG_HOME" )
        let g:vim_config_home = expand( "$XDG_CONFIG_HOME/vim" )
    else
        let g:vim_config_home = expand( "$HOME/.config/vim" )
    endif

    if exists( "$XDG_CACHE_HOME" )
        let g:vim_cache_home = expand( "$XDG_CACHE_HOME/vim" )
    else
        let g:vim_cache_home = expand( "$HOME/.local/cache/vim" )
    endif

    if exists( "$XDG_DATA_HOME" )
        let g:vim_data_home = expand( "$XDG_DATA_HOME/vim" )
    else
        let g:vim_data_home = expand( "$HOME/.local/share/vim" )
    endif
endfunction

function! SetUserRuntimePath( dir )
    let l:user_rtp = a:dir
    let l:runtimepath_old = &runtimepath
    let &runtimepath .= ',' . expand(l:user_rtp)
    let &runtimepath .= ',' . expand(l:user_rtp) . '/after'
    let &runtimepath .= ',' . expand(l:runtimepath_old)
endfunction

function! SetUserBackupdir( dir )
    if $USER == 'root'
        set nobackup
        return
    endif

    let &backupdir = a:dir . "/backup"
    if !isdirectory( expand( &backupdir ) )
        call mkdir( expand( &backupdir ), "p", 0700 )
    endif
endfunction

function! SetUserSwapdir( dir )
    if $USER == 'root'
        set noswapfile
        return
    endif

    let &directory = a:dir . "/swap"
    if !isdirectory( expand( &directory ) )
        call mkdir( expand( &directory ), "p", 0700 )
    endif
endfunction

function! SetUserViewdir( dir )
    if !has( 'mksession' )
        return
    endif

    let &viewdir = a:dir . "/views"
    if !isdirectory( expand( &viewdir ) )
        call mkdir( expand( &viewdir ), "p", 0700 )
    endif
endfunction

function! SetUserUndodir( dir )
    if !has( 'persistent_undo' )
        return
    endif

    let &undodir = a:dir . "/undo"
    if !isdirectory( expand( &undodir ) )
        call mkdir( expand( &undodir ), "p", 0700 )
    endif
endfunction

function! SetUserViminfo( dir )
    if !has( 'viminfo' )
        return
    endif

    if !isdirectory( a:dir )
        call mkdir( a:dir, "p", 0700 )
    endif

    set nocompatible
    let &viminfo = "'1000,<50,s10,n" . a:dir . "/viminfo"
endfunction


"###########
"# Options #
"###########

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
    set autoread
    set fileformats=unix,dos,mac
    set display+=lastline
    set noerrorbells
    set visualbell
    set t_vb=
    set showmatch

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

    if &listchars ==# 'eol:$'
        set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    endif

    " load the matchit macros
    if !exists('g:loaded_matchit') && findfile('plugins/matchit.vim', &rtp) ==# ''
        runtime! macros/matchit.vim
    endif
endfunction

function! SetFeatureDependentOptions()
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
endfunction


"#########
"# Setup #
"#########

call CheckXDGVars()
call SetUserRuntimePath( g:vim_config_home )
call SetUserSwapdir( g:vim_data_home )
call SetUserUndodir( g:vim_data_home )
call SetUserViewdir( g:vim_data_home )
call SetUserBackupdir( g:vim_data_home )
call SetUserViminfo( g:vim_cache_home )
call SetOptions()
call SetFeatureDependentOptions()
