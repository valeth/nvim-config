call plug#begin($vim_datadir . '/plugins')

" Always load
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/gnupg'

" Load on demand
Plug 'scrooloose/nerdtree',             { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdtree-git-plugin',  { 'on': 'NERDTreeToggle' }
Plug 'vim-scripts/Gundo',               { 'on': 'GundoToggle' }
Plug 'Valloric/YouCompleteMe',          { 'do': './install.sh --clang-completer --system-libclang' }

call plug#end()
