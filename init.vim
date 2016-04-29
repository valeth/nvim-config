" Maintainer:   Patrick Auernig <patrick DOT auernig AT gmail DOT com>
" VIM Version:  NVIM 0.1.4
" Source:       https://gitlab.com/valeth/vim-config
" Mirror:       https://github.com/valeth/vim-config


" XDG Directories           {{{
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
" }}}

" Settings                  {{{

" prompt with save dialog on exit
set confirm

" wait only a short amount of time
set notimeout
set ttimeout
set timeoutlen=10
set visualbell t_vb=

" automatically do stuff
set autochdir
set autoread
set autowriteall

" scroll n lines before hitting the border
set scrolloff=3
set sidescrolloff=5

" show line numbers
set number

" show position
set ruler

" ignore case when searching
set ignorecase
set smartcase
set incsearch
set gdefault

" show matching parenthesis
set showmatch
set matchtime=3


" show hidden characters
set listchars=tab:»\ ,trail:◆,extends:❯,precedes:❮,eol:↲,nbsp:·
set breakindent
set breakindentopt=sbr
set showbreak=↳
set list

set shortmess=aoOtTI

" share yank buffer with system clipboard
set clipboard+=unnamed

" indent automatically
set autoindent
set smartindent

set undofile

set noswapfile

" change split behaviour
set splitbelow
set splitright

" show sane line lenght limit marker
set colorcolumn=+3

" wildmenu completion
set wildmenu
set wildmode=list:longest,full
set wildignore+=.git
set wildignore+=*.bak,*.old,*.swp,*~
set wildignore+=*.o,*.hi
set wildignore+=*.pyc,*.class
set wildignore+=*.pdf,*.aux
set wildignore+=*.png,*.jpg

set virtualedit+=block

set foldcolumn=1
set foldlevel=99
set foldmethod=syntax
set foldtext=myfold#text()

set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" enable syntax highlighting and filetype detection
filetype indent on
filetype plugin on
syntax enable
set synmaxcol=300
" }}}

" Keyboard mappings         {{{
let g:mapleader = ","
let g:maplocalleader = "\\"

command! Wq wq
command! WQ wq
command! Q q
command! W w

noremap <silent> <Leader><CR> :noh<CR>

nnoremap U :redo<CR>
nnoremap <C-R> <NOP>
nnoremap <Leader>vl :setlocal cursorline!<CR>
nnoremap <Leader>vc :setlocal cursorcolumn!<CR>
nnoremap <Leader>ve :setlocal colorcolumn=80<CR>
nnoremap <Leader>vn :setlocal colorcolumn=0<CR>
nnoremap <Leader>tcs :call ToggleColorscheme()<CR>
nnoremap Y y$
nnoremap j gj
nnoremap k gk
nnoremap <leader>fmt gg=G<CR>``
nnoremap gr gd[{V%::s/<C-R>///g<left><left>
nnoremap gR gD:%s/<C-R>///g<left><left>
nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<CR>
nnoremap tq :tabclose<CR>

nnoremap <CR> o<ESC>

" change beginning and end mappings
noremap H ^
noremap L $
vnoremap L g_
inoremap <C-a> <ESC>I
inoremap <C-e> <ESC>A
cnoremap <C-a> <HOME>
cnoremap <C-e> <END>

" movement
noremap j gj
noremap k gk
noremap gj j
noremap gj j

" go to last change
nnoremap gC `.

" stay in center when searching
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <C-o> <C-o>zz

" toggle invlist
nnoremap <silent> <leader>il :set invlist<CR>
vnoremap <silent> <leader>il :<C-W>set invlist<CR>

" make substitutions more convenient
nnoremap <C-s> :%s/
vnoremap <C-s> :s/

nnoremap / /\v
vnoremap / /\v

" quicker escape
inoremap jk <ESC>
inoremap JK <ESC>
inoremap Jk <ESC>

" indent in visual mode and keep selection
vnoremap < <gv
vnoremap > >gv

" just in case I forgot sudo again
cnoremap w! w !sudo tee % >/dev/null

tnoremap <ESC> <C-\><C-n>
tnoremap <leader><ESC> <ESC>

" NOP(E)s
noremap <F1> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
" }}}

" Autocommands              {{{
augroup LineReturn
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

augroup ToggleLineNumbers
    au!
    au VimEnter,WinEnter,InsertLeave * setlocal relativenumber
    au WinLeave,InsertEnter * setlocal norelativenumber
augroup END

augroup CursorLineColumn
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
    au WinLeave * setlocal nocursorline nocursorcolumn
augroup END

augroup AutoReload
    au!
    au BufWritePost $MYVIMRC source $MYVIMRC
augroup END

au FocusLost * :silent! wa

" keep splits equal on terminal resize
au VimResized * :wincmd =

augroup Trailing
    au!
    au InsertEnter * :set invlist
    au InsertLeave * :set invlist
augroup END
" }}}

" Plugins                   {{{
call plug#begin(g:vim_data_home . '/plugins')
runtime! plugins/**/*.vim
call plug#end()
" }}}

" Colorscheme               {{{
function! ToggleColorscheme()
    if g:colors_name =~ 'seoul256'
        call ToggleSeoul256()
    elseif g:colors_name =~ 'Tomorrow'
        call ToggleTomorrow()
    else
        call ToggleBackground()
    endif

    AirlineRefresh
endfunction

function! ToggleBackground()
        if &background == 'dark'
            set background=light
        else
            set background=dark
        endif
endfunction

"colorscheme molokai
colorscheme seoul256
"colorscheme PaperColor
"colorscheme Tomorrow-Night
" }}}

" vim:set foldmethod=marker foldlevel=0:
