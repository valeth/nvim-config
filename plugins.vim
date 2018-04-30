Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'cohama/lexima.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'editorconfig/editorconfig-vim'
Plug 'hallison/vim-rdoc', { 'for': 'ruby' }
Plug 'Konfekt/FastFold'
Plug 'Matt-Deacalion/vim-systemd-syntax', { 'for': 'systemd' }
Plug 'majutsushi/tagbar'
Plug 'ngmy/vim-rubocop', { 'for': 'ruby' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'valeth/breezy', { 'branch': 'swap-bg-color' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'vim-pandoc/vim-pandoc', { 'for': ['markdown'] }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': ['markdown'] }
Plug 'w0rp/ale'
Plug 'wakatime/vim-wakatime'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'Yggdroot/indentLine', { 'for': 'python' }
" Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins' }

" # Configuration

" ## vim-airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dark'
let g:airline_powerline_fonts = 1
" }}}

" ## indentLine {{{
let g:indentLine_char = '┆'
""" }}}

" ## vim-tmux-navigator {{{
let g:tmux_navigator_no_mappings = 1
" }}}

" ## nerdtree {{{
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd bufenter * if exists("b:NERDTree") | setlocal nonumber norelativenumber | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Ignored"   : "☒",
    \ "Unknown"   : "?"
    \ }
" }}}

" ## vim-pandoc {{{
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#folding#fdc = &fdc
let g:pandoc#spell#enabled = 0
" }}}

" ## deoplete + LanguageClient {{{
Plug 'autozimu/LanguageClient-neovim', { 'do': 'bash install.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
" }}}
