call plug#begin(g:vim_data_home . '/plugins')


" [Misc]
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
" Plug 'cohama/lexima.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Konfekt/FastFold'
Plug 'majutsushi/tagbar'

" [UI]
Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dark'
let g:airline_powerline_fonts = 1

Plug 'Yggdroot/indentLine', { 'for': 'python' }
let g:indentLine_char = '┆'

Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1

Plug 'scrooloose/nerdtree',         { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd bufenter * if exists("b:NERDTree") | setlocal nonumber norelativenumber | endif
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


" [Assistants]
"Plug 'scrooloose/syntastic'
"let g:syntastic_check_on_open             = 1
"let g:syntastic_check_on_wq               = 0
"let g:syntastic_auto_loc_list             = 1
"let g:syntastic_loc_list_height           = 5
"let g:syntastic_c_check_header            = 1
"let g:syntastic_cpp_remove_include_errors = 1
"let g:syntastic_cpp_check_header          = 1
"let g:syntastic_cpp_auto_refresh_includes = 1
"let g:syntastic_tex_checkers              = ["false"]
"let g:syntastic_error_symbol              = '☓'
"let g:syntastic_warning_symbol            = '⚠'

Plug 'w0rp/ale'

" [Language Specific]
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#folding#fdc = &fdc
" let g:pandoc#filetypes#handles = ['markdown', 'pandoc']
" let g:pandoc#filetypes#pandoc_markdown = 1
" let g:pandoc#spell#enabled = 0

Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'Matt-Deacalion/vim-systemd-syntax', { 'for': 'systemd' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'ngmy/vim-rubocop',  { 'for': 'ruby' }
Plug 'hallison/vim-rdoc', { 'for': 'ruby' }


"Plug 'arcticicestudio/nord-vim'

call plug#end()
