set confirm
set ttimeout
set timeoutlen=500
set autochdir
set autowrite
set scrolloff=1
set sidescrolloff=5
set number
set ignorecase
set smartcase
set listchars=tab:»\ ,trail:◆,extends:▹,precedes:◃,eol:↲,nbsp:·
set showmatch
set shortmess=aoOtTI

if has('smartindent')
    set smartindent
endif

" enable filetype plugins
if has('autocmd')
    filetype indent on
    filetype plugin on
endif


"if !exists('g:loaded_matchit') && findfile('plugins/matchit.vim', &rtp) ==# ''
"runtime! macros/matchit.vim
"endif

if has('windows')
    set splitbelow
    set splitright
endif

if has('linebreak')
    let &showbreak = '↳ '

    if v:version >=704
        set breakindent
        set breakindentopt=sbr
    endif
endif

if has('cmdline_info')
    set ruler
    set showcmd
endif

if has('wildmenu')
    set wildmode=list:longest,full
    set wildignore=.bak,.old,.swp,~
endif

if has('virtualedit')
    set virtualedit=block
endif

if has('syntax')
    syntax enable
endif

aug CursorLineColumn
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
    au WinLeave * setlocal nocursorline nocursorcolumn
aug END

"set visualbell
"set t_vb=

if has('folding')
    set foldcolumn=1
    set foldlevel=99
    set foldmethod=syntax
    set foldtext=MyFoldText()

    let g:sh_fold_enabled=1

    function! MyFoldText()
        " get actual numberwidth of the current document
        let nw_add = (len(line('$')) - (&numberwidth - 1))
        if nw_add > 0
            let nw = &numberwidth + nw_add
        else
            let nw = &numberwidth
        endif

        let numfold_w =(nw * &number) + &foldcolumn
        let window_w = winwidth(0) - numfold_w
        let onetab = strpart('          ', 0, &tabstop)

        let foldtxt_start = getline(v:foldstart) . '  …'
        let foldtxt_start = substitute(foldtxt_start, '\t', onetab, 'g')
        let foldtxt_start_w = len(foldtxt_start) - 2

        let foldtxt_end = '+' . string(foldclosedend(v:foldend) - foldclosed(v:foldstart)) . '         '
        let foldtxt_end_w = len(foldtxt_end)

        let foldtxt_mid_w = window_w - (foldtxt_start_w + foldtxt_end_w)
        let foldtxt_mid = repeat(' ', foldtxt_mid_w + 2)

        return foldtxt_start . foldtxt_mid . foldtxt_end
    endfunction
endif
