" Maintainer:   Patrick Auernig <dev.patrick.auernig@gmail.com>
" VIM Version:  NVIM 0.2.0
" Source:       https://gitlab.com/valeth/vim-config
" Mirror:       https://github.com/valeth/vim-config

let g:vim_config_home = split(&rtp, ',')[0]
let g:vim_data_home = &undodir[0:-6]

" SETTINGS {{{
set autowriteall
set backupdir-=.
set breakindent
set breakindentopt=sbr
set clipboard+=unnamed,unnamedplus
set completeopt=longest,menuone,preview
set confirm
set foldcolumn=0
set foldlevel=99
set foldmethod=syntax
set foldtext=myfold#text()
set gdefault
set grepprg=grep\ -nH\ $*
set hidden
set ignorecase
set listchars=tab:»\ ,trail:◆,extends:❯,precedes:❮,eol:↲,nbsp:·
set matchtime=3
set mouse=a
set noshowmode
set noswapfile
set notimeout
set nowrap
set number
set ruler
set scrolloff=3
set showmatch
set showbreak=↳
set shortmess=aoOtTI
set sidescrolloff=5
set smartcase
set smartindent
set splitbelow
set splitright
set synmaxcol=300
set timeoutlen=50
set ttimeout
set undofile
set virtualedit+=block
set visualbell t_vb=
set wildignore+=.git
set wildignore+=*.bak,*.old,*.swp,*~
set wildignore+=*.o,*.hi
set wildignore+=*.pyc,*.class
set wildignore+=*.pdf,*.aux
set wildignore+=*.png,*.jpg
set wildmode=list:longest,full
" }}}

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

runtime! plugins.vim
runtime! keymaps.vim

augroup ToggleLineNumbers
    au!
    au VimEnter,WinEnter,InsertLeave * setlocal relativenumber
    au WinLeave,InsertEnter * setlocal norelativenumber
augroup END

augroup CursorHighlight
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
    au VimEnter,WinEnter,BufWinEnter * setlocal colorcolumn=+3
    au WinLeave * setlocal colorcolumn=0
augroup END

" save automatically
autocmd FocusLost * :silent! wa

" keep splits equal on terminal resize
autocmd VimResized * :wincmd =

set termguicolors
colorscheme breezy
let g:airline_theme='breezy'

call matchadd('ColorColumn', '\%81v', 100)
