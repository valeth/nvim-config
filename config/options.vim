set listchars=tab:»\ ,trail:◆,extends:▹,precedes:◃,eol:↲,nbsp:·
set ignorecase
set smartcase
set confirm
set autowrite
set shortmess=aoOtTI
set clipboard=unnamed,unnamedplus,autoselect

set softtabstop=4
set shiftwidth=4
set smartindent
set expandtab 

set wildmode=longest:full,list
set wildignore=.bak,.old,.swp,~
set autochdir

if v:version >= 704
    set undofile
    set undolevels=1000
endif

set report=0
set updatetime=1500
set switchbuf=useopen,usetab
set pumheight=10
set diffopt+=context:3
set matchtime=2

set foldcolumn=0
set foldlevel=1
set foldmethod=syntax

set nowrap

set t_Co=256
