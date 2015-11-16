Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

au bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
noremap  <silent> <leader>nt :NERDTreeToggle<CR>
vnoremap <silent> <leader>nt <ESC>:NERDTreeToggle<CR>
