call plug#begin(g:vim_data_home . '/plugins')

" always load
Plug 'scrooloose/nerdcommenter'

Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/gnupg'
Plug 'tomasr/molokai'
Plug 'hoelzro/vim-polyglot'
Plug 'bling/vim-airline' "until powerline works in neovim
Plug 'junegunn/seoul256.vim'
"Plug 'godlygeek/csapprox'
"Plug 'jiangmiao/auto-pairs'
"Plug 'tpope/vim-commentary'

" on demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

"Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
"Plug 'Twinside/vim-haskellConceal', { 'for': 'haskell' }
"Plug 'lukerandall/haskellmode-vim', { 'for': 'haskell' }

Plug 'scrooloose/syntastic', {'for': ['c', 'cpp', 'python', 'sh']}

if v:version >= 704
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'Valloric/YouCompleteMe', {'do': 'python2 install.py --clang-completer' }
endif

if v:version >= 703
    Plug 'vim-scripts/Gundo', { 'on': 'GundoToggle' }
endif

call plug#end()
