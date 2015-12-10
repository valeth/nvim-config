"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                             "
"   Maintainer:   Patrick Auernig <patrick DOT auernig AT gmail DOT com>      "
"   VIM Version:  NVIM 0.1.0                                                  "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""
" XDG Directories "
"""""""""""""""""""
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


""""""""""""
" Settings "
""""""""""""
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
set clipboard+=unnamedplus
set smartindent
set undofile
set splitbelow
set splitright
set breakindent
set breakindentopt=sbr
let &showbreak = '↳ '
set ruler
set showcmd
set wildmode=list:longest,full
set wildignore=.bak,.old,.swp,~
set virtualedit=block
set foldcolumn=1
set foldlevel=99
set foldmethod=syntax
set foldtext=myfold#text()
let g:sh_fold_enabled=1
set visualbell
set t_vb=

filetype indent on
filetype plugin on
syntax enable


"""""""""""""""""""""
" Keyboard mappings "
"""""""""""""""""""""
let g:mapleader = ","

command! Wq wq
command! WQ wq
command! Q q
command! W w

noremap <silent> <Leader><CR> :noh<CR>

nnoremap <F1> <NOP>
nnoremap U :redo<CR>
nnoremap <C-R> <NOP>
nnoremap <Leader>vl :setlocal cursorline!<CR>
nnoremap <Leader>vc :setlocal cursorcolumn!<CR>
nnoremap <Leader>ve :setlocal colorcolumn=80<CR>
nnoremap <Leader>vn :setlocal colorcolumn=0<CR>
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
nnoremap <silent> <leader>il :set invlist<CR>

inoremap <F1> <NOP>
inoremap jk <ESC>
inoremap JK <ESC>
inoremap Jk <ESC>

vnoremap < <gv
vnoremap > >gv
vnoremap <silent> <leader>il :<C-W>set invlist<CR>

cnoremap sudow w !sudo tee % >/dev/null

tnoremap <ESC> <C-\><C-n>


""""""""""""""""
" Autocommands "
""""""""""""""""
aug ToggleLineNumbers
    au!
    au VimEnter,WinEnter,InsertLeave * setlocal relativenumber
    au WinLeave,InsertEnter * setlocal norelativenumber
aug END

aug CursorLineColumn
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
    au WinLeave * setlocal nocursorline nocursorcolumn
aug END

augroup AutoReload
    au!
    au BufWritePost $MYVIMRC source $MYVIMRC
augroup END


"""""""""""
" Plugins "
"""""""""""
call plug#begin(g:vim_data_home . '/plugins')
runtime! plugins/**/*.vim
call plug#end()


"""""""""""""""
" Colorscheme "
"""""""""""""""
colorscheme seoul256
"colorscheme molokai

