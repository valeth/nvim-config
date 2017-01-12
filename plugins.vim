call plug#begin(g:vim_data_home . '/plugins')


" [Misc]
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dark'
let g:airline_powerline_fonts = 1
"Plug 'mtth/scratch.vim', { 'on': 'Scratch' }
"let g:scratch_persistence_file = g:vim_data_home . "/scratch.vim"
"Plug 'vim-scripts/gnupg'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/Tail-Bundle'
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '┆'


" [Syntastic]
Plug 'scrooloose/syntastic'
let g:syntastic_check_on_open             = 1
let g:syntastic_check_on_wq               = 0
let g:syntastic_auto_loc_list             = 1
let g:syntastic_loc_list_height           = 5
let g:syntastic_c_check_header            = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header          = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_tex_checkers              = ["false"]
let g:syntastic_error_symbol              = '☓'
let g:syntastic_warning_symbol            = '⚠'


" [Autocomplete]
let g:deoplete#enable_at_startup = 1
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neoinclude.vim',    { 'for': ['c', 'cpp'] }
Plug 'Rip-Rip/clang_complete',   { 'for': ['c', 'cpp'] }
Plug 'zchee/deoplete-jedi',      { 'for': 'python' }
Plug 'racer-rust/vim-racer',     { 'for': 'rust' }
Plug 'eagletmt/neco-ghc',        { 'for': 'haskell' }
Plug 'steelsojka/deoplete-flow', { 'for': 'javascript' }


" [Version Control]
Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'


" [Navigation]
Plug 'kien/ctrlp.vim'
Plug 'Konfekt/FastFold'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
Plug 'scrooloose/nerdtree',         { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd bufenter * if exists("b:NERDTree") | setlocal nonumber norelativenumber | endif
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "~",
    \ "Staged"    : "+",
    \ "Untracked" : "*",
    \ "Renamed"   : ">",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "-",
    \ "Dirty"     : "!",
    \ "Unknown"   : "?"
    \ }


" [LaTeX]
Plug 'WChargin/vim-latexsuite', { 'for': ['tex', 'latex'] }
let g:tex_flavor               = "latex"
let g:tex_fold_enabled         = 1
let g:Imap_UsePlaceHolders     = 0
let g:Tex_ViewRule_dvi         = ""
let g:Tex_ViewRule_ps          = ""
let g:Tex_ViewRule_pdf         = ""
let g:Tex_ViewRuleComplete_dvi = "pgrep okular.*$* || xdg-open &"
let g:Tex_ViewRuleComplete_ps  = ""
let g:Tex_ViewRuleComplete_pdf = "pgrep okular.*$* || xdg-open &"
let g:Tex_DefaultTargetFormat  = "pdf"


" [Pandoc]
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
let g:pandoc#filetypes#handles = ['markdown', 'pandoc']
let g:pandoc#filetypes#pandoc_markdown = 1
let g:pandoc#spell#enabled = 0
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#folding#fdc = &fdc

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Syntax
"Plug 'vim-scripts/fish-syntax'
Plug 'dag/vim-fish'
Plug 'valeth/sprak.vim', { 'for': 'sprak' }
Plug 'sheerun/vim-polyglot'
Plug 'Matt-Deacalion/vim-systemd-syntax', { 'for': 'systemd' }

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" JavaScript
"Plug 'dsawardekar/ember.vim' ", { 'for': 'javascript' }

" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'ngmy/vim-rubocop',  { 'for': 'ruby' }
Plug 'hallison/vim-rdoc', { 'for': 'ruby' }
Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }
"Plug 'tpope/vim-bundler',  { 'for': 'ruby' }
"Plug 'nyangry/rsense.vim', { 'for': 'ruby' }
"Plug 'tpope/vim-rails',    { 'for': 'ruby' }
"Plug 'dsawardekar/portkey' ", { 'for': ['ruby', 'javascript'] }


" Dragvisuals
Plug 'tsaleh/vim-align'
Plug 'taku-o/vim-vis'
Plug 'clones/vim-cecutil'
Plug 'atweiden/vim-dragvisuals'
vmap  <expr>  <C-h>  DVB_Drag('left')
vmap  <expr>  <C-l>  DVB_Drag('right')
vmap  <expr>  <C-j>  DVB_Drag('down')
vmap  <expr>  <C-k>  DVB_Drag('up')
vmap  <expr>  <C-D>  DVB_Duplicate()


" [Autopairs]
Plug 'cohama/lexima.vim'
"Plug 'Raimondi/delimitMate'


" [Colorschemes]
"Plug 'tomasr/molokai'
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'chriskempson/tomorrow-theme'
Plug 'junegunn/seoul256.vim'
function! ToggleColorscheme()
    if g:colors_name == 'Tomorrow'
        colorscheme seoul256
    else
        colorscheme Tomorrow
    endif

    AirlineRefresh
endfunction
let g:seoul256_background       = 237
let g:seoul256_light_background = 254


call plug#end()

colorscheme seoul256
