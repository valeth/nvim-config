call plug#begin(g:vim_data_home . '/plugins')

" Always load
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'

Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/gnupg'
"Plug 'tomasr/molokai'
Plug 'junegunn/seoul256.vim'

Plug 'scrooloose/nerdtree',             { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdtree-git-plugin',  { 'on': 'NERDTreeToggle' }

if v:version >= 704
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'Valloric/YouCompleteMe',          { 'do': './install.sh --clang-completer --system-libclang' }
endif

if v:version >= 703
Plug 'vim-scripts/Gundo',               { 'on': 'GundoToggle' }
endif

call plug#end()
