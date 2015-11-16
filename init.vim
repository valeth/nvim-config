"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                             "
"   Maintainer:   Patrick Auernig <patrick DOT auernig AT gmail DOT com>      "
"   VIM Version:  7.4                                                         "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""
" Core: XDG Directories "
"""""""""""""""""""""""""

let g:vim_config_home = split(&rtp, ',', 0)[0]

if exists('$XDG_CACHE_HOME')
    let g:vim_cache_home = expand('$XDG_CACHE_HOME/') . v:progname
else
    let g:vim_cache_home = expand('$HOME/.local/cache/') . v:progname
endif

if exists('$XDG_DATA_HOME')
    let g:vim_data_home = expand('$XDG_DATA_HOME/') . v:progname
else
    let g:vim_data_home = expand('$HOME/.local/share/') . v:progname
endif

" reload config
augroup myvimrc
    au!
    au BufWritePost $MYVIMRC source $MYVIMRC
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""
" Compat: Just for compatability with legacy vim "
""""""""""""""""""""""""""""""""""""""""""""""""""

if ! has('nvim')
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

    " options that have been removed from neovim
    if v:version >= 704 
        set cryptmethod=blowfish

        au BufReadPost * if &key != "" | set noswapfile nowritebackup viminfo= nobackup noshelltemp history=0 secure | endif
    endif
endif

if v:version >= 704
    set undofile

    aug LineNumbers
        au!
        au VimEnter,WinEnter,InsertLeave * setlocal relativenumber
        au WinLeave,InsertEnter * setlocal norelativenumber
    aug END
endif

if has('xterm_clipboard')
    set clipboard=unnamed,unnamedplus,autoselect
endif


"""""""""""""""""""""""""""""""""""
" Settings: All kinds of settings "
"""""""""""""""""""""""""""""""""""

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


"""""""""""""""""""""""""""""""
" Mappings: Keyboard mappings "
"""""""""""""""""""""""""""""""

let g:mapleader = ","

command! Wq wq
command! WQ wq
command! Q q
command! W w

nnoremap U :redo<CR>
nnoremap <C-R> <NOP>

" allow explicit writing of read-only files with sudo
cnoremap sudow w !sudo tee % >/dev/null

" unset search highlighting
noremap <silent> <Leader><CR> :noh<CR>

nnoremap <Leader>vl :setlocal cursorline!<CR>
nnoremap <Leader>vc :setlocal cursorcolumn!<CR>
nnoremap <Leader>ve :setlocal colorcolumn=80<CR>
nnoremap <Leader>vn :setlocal colorcolumn=0<CR>

nnoremap Y y$
nnoremap j gj
nnoremap k gk

" unset default help shortcut
nnoremap <F1> <NOP>
inoremap <F1> <NOP>

inoremap jk <ESC>
inoremap JK <ESC>
inoremap Jk <ESC>

vnoremap < <gv
vnoremap > >gv

" fix indentation of an entire file
nnoremap <leader>fmt gg=G<CR>``

" local replace
nnoremap gr gd[{V%::s/<C-R>///g<left><left>
nnoremap gR gD:%s/<C-R>///g<left><left>

if v:progname == 'nvim'
	tnoremap <ESC> <C-\><C-n>
endif

" highlight searches and search while typing
if has('extra_search')
	if maparg('<C-L>', 'n') ==# ''
		nnoremap <silent><C-L> :nohlsearch<CR><C-L>
	endif
endif

nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<CR>
nnoremap tq :tabclose<CR>

nnoremap <silent> <leader>il :set invlist<CR>
vnoremap <silent> <leader>il :<C-W>set invlist<CR>

if exists('$TMUX')
	function! TmuxOrSplitSwitch(wincmd, tmuxdir)
		let previous_winnr = winnr()
		silent! execute "wincmd " . a:wincmd
		if previous_winnr == winnr()
			call system("tmux select-pane -" . a:tmuxdir)
			redraw!
		endif
	endfunction

	let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
	let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
	let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

	noremap <silent><C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
	noremap <silent><C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
	noremap <silent><C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
	noremap <silent><C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
	noremap <silent><C-b> :call TmuxOrSplitSwitch('b', 'l')<cr>
else
	noremap <C-h> <C-w>h
	noremap <C-j> <C-w>j
	noremap <C-k> <C-w>k
	noremap <C-l> <C-w>l
endif


"""""""""""""""""""""""""""""""""""""""""
" Plugins: Plugin loading with vim-plug "
"""""""""""""""""""""""""""""""""""""""""
call plug#begin(g:vim_data_home . '/plugins')
runtime! plugins/**/*.vim
call plug#end()

""""""""""""""""
" Colorscheme: "
""""""""""""""""
colorscheme seoul256
"colorscheme molokai
