set autochdir
set autowriteall
set backupdir-=.
set breakindent
set breakindentopt=sbr
set clipboard+=unnamed,unnamedplus
set completeopt=longest,menuone,preview
set confirm
set foldcolumn=1
set foldlevel=99
set foldmethod=syntax
set foldtext=myfold#text()
set gdefault
set grepprg=grep\ -nH\ $*
set hidden
set ignorecase
set listchars=tab:»\ ,trail:◆,extends:❯,precedes:❮,eol:↲,nbsp:·
set matchtime=3
set noshowmode
set noswapfile
set notimeout
set number
set ruler
set scrolloff=3
"set shell=sh " because vim's system function is shit
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
