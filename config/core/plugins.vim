call plug#begin($vim_configdir . '/plugins')

" Always load
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'jiangmiao/auto-pairs'

" Load on demand
Plug 'scrooloose/nerdtree',             { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdtree-git-plugin',  { 'on': 'NERDTreeToggle' }
Plug 'vim-scripts/Gundo',               { 'on': 'GundoToggle' }
Plug 'vim-scripts/gnupg',               { 'for': ['gpg', 'asc'] }
Plug 'Valloric/YouCompleteMe',          { 'do': './install.sh --clang-completer --system-libclang' }
Plug 'kien/ctrlp.vim',                  { 'on': 'CtrlP' }
Plug 'majutsushi/tagbar',               { 'on': 'TagbarToggle' }

call plug#end()
