" Maintainer:   Patrick Auernig <patrick DOT auernig AT gmail DOT com>
" VIM Version:  NVIM 0.1.4
" Source:       https://gitlab.com/valeth/vim-config
" Mirror:       https://github.com/valeth/vim-config


" [NVim Directories] {{{
let g:vim_config_home = split(&rtp, ',', 0)[0]

if exists('$XDG_CACHE_HOME')
    let g:vim_cache_home = expand('$XDG_CACHE_HOME/') . v:progname
else
    let g:vim_cache_home = expand('$HOME/.local/cache/') . v:progname
endif

if exists('$XDG_DATA_HOME')
    let g:vim_data_home = expand('$XDG_DATA_HOME/') . v:progname
else
    let g:vim_data_home = expand('$HOME/.local/share/') . v:progname
endif
" [NVim Directories] }}}

" [Settings] {{{
set autochdir
set autowriteall
set breakindent
set breakindentopt=sbr
set clipboard+=unnamed
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
set list
set listchars=tab:»\ ,trail:◆,extends:❯,precedes:❮,eol:↲,nbsp:·
set matchtime=3
set noshowmode
set noswapfile
set notimeout
set number
set ruler
set scrolloff=3
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
" [Settings] }}}

" [Plugins] {{{
call plug#begin(g:vim_data_home . '/plugins')

" <deoplete> {{{
function! DoRemote(arg)
    UpdateRemotePlugins
endfunction

let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
"let g:deoplete#sources#clang#clang_header = '/usr/include/clang'

Plug 'Shougo/vimproc.vim',      { 'do': 'make' }
Plug 'Shougo/deoplete.nvim',    { 'do': function('DoRemote') }
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neoinclude.vim',   { 'for': ['c', 'cpp'] }
Plug 'Rip-Rip/clang_complete',  { 'for': ['c', 'cpp'] }
"Plug 'zchee/deoplete-clang',    { 'for': ['c', 'cpp'] }
Plug 'zchee/deoplete-jedi',     { 'for': ['python'] }
Plug 'eagletmt/neco-ghc',       { 'for': ['haskell'] }
" <deoplete> }}}

" <ctrlp.vim> {{{
Plug 'kien/ctrlp.vim'
" <ctrlp.vim> }}}

" <latexsuite> {{{
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

Plug 'WChargin/vim-latexsuite', { 'for': ['tex', 'latex'] }
" <latexsuite> }}}

" <nerdtree> {{{
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

au BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" <nerdtree> }}}

" <syntastic> {{{
Plug 'scrooloose/syntastic', {'for': ['c', 'cpp', 'python', 'sh', 'ruby']}

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_c_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_tex_checkers = ["false"]
let g:syntastic_error_symbol = '☓'
let g:syntastic_warning_symbol = '⚠'
" <syntastic> }}}

" <tagbar> {{{
Plug 'majutsushi/tagbar'
" <tagbar> }}}

" <airline> {{{
Plug 'bling/vim-airline'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
" <airline> }}}

" <scratch.vim> {{{
Plug 'mtth/scratch.vim', { 'on': 'Scratch' }

let g:scratch_persistence_file = g:vim_data_home . "/scratch.vim"
" <scratch.vim> }}}

" <vim-pandoc> {{{
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

let g:pandoc#filetypes#handles = [ "markdown", "pandoc" ]
let g:pandoc#filetypes#pandoc_markdown = 1
let g:pandoc#spell#enabled = 0
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#folding#fdc = &fdc
" <vim-pandoc> }}}

" <vim-tmux-navigator> {{{
Plug 'christoomey/vim-tmux-navigator'

let g:tmux_navigator_no_mappings = 1
" <vim-tmux-navigator> }}}

Plug 'Konfekt/FastFold'
Plug 'vim-scripts/fish-syntax'
Plug 'valeth/sprak.vim', { 'for': 'sprak' }
Plug 'hoelzro/vim-polyglot'
Plug 'vim-scripts/gnupg'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive', { 'on': ['Gstatus', 'Gcommit']}
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'Matt-Deacalion/vim-systemd-syntax', { 'for': 'systemd' }

Plug 'tomasr/molokai'
Plug 'junegunn/seoul256.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'chriskempson/tomorrow-theme'

call plug#end()
" [Plugins] }}}

" [Keymappings] {{{
let g:mapleader = ","
let g:maplocalleader = "\\"

" <Command> {{{
command!  Wq    wq
command!  WQ    wq
command!  Q     q
command!  W     w
" <Command> }}}

" <Plugin> {{{
nnoremap  <C-b>                     :CtrlPBuffer<CR>
inoremap  <C-b>                     <C-o>:CtrlPBuffer<CR>
nnoremap  <C-p>                     :CtrlP<CR>
inoremap  <C-p>                     <C-o>:CtrlP<CR>
nnoremap  <SID>                     <Plug>Tex_Help
inoremap  <SID>                     <Plug>Tex_Help
nnoremap  <SID>                     <Plug>IMAP_JumpForward
vnoremap  <SID>                     <Plug>IMAP_JumpForward
"noremap  <buffer><F5>              :w<CR> :!pdflatex -shell-escape "%" && { pgrep ".*%:p || xdg-open %:p:r.pdf }<CR>
noremap   <silent><Leader>nt        :NERDTreeToggle<CR>
vnoremap  <silent><Leader>nt        <ESC>:NERDTreeToggle<CR>
nnoremap  <Leader>syn               :SyntasticToggleMode<CR>
vnoremap  <Leader>syn               <ESC>:SyntasticToggleMode<CR>
nnoremap  <silent><Leader>tag       :TagbarToggle<CR>
vnoremap  <silent><Leader>tag       <ESC>:TagbarToggle<CR>
nnoremap  <silent><M-h>             :TmuxNavigateLeft<CR>
nnoremap  <silent><M-j>             :TmuxNavigateDown<CR>
nnoremap  <silent><M-k>             :TmuxNavigateUp<CR>
nnoremap  <silent><M-l>             :TmuxNavigateRight<CR>
nnoremap  <silent><M-\>             :TmuxNavigatePrevious<CR>
" <Plugin> }}}

" <Disabled> {{{
nnoremap  <F1>                      <NOP>
inoremap  <F1>                      <NOP>
nnoremap  <C-R>                     <NOP>
noremap   <Left>                    <NOP>
noremap   <Right>                   <NOP>
noremap   <Up>                      <NOP>
noremap   <Down>                    <NOP>
noremap   ^                         <NOP>
noremap   $                         <NOP>
" <Disabled> }}}

noremap   <silent><Leader><CR>      :noh<CR>
nnoremap  U                         :redo<CR>
nnoremap  <Leader>vl                :setlocal cursorline!<CR>
nnoremap  <Leader>vc                :setlocal cursorcolumn!<CR>
nnoremap  <Leader>ve                :setlocal colorcolumn=+3<CR>
nnoremap  <Leader>vn                :setlocal colorcolumn=0<CR>
nnoremap  <Leader>tcs               :call ToggleColorscheme()<CR>
nnoremap  Y                         y$
nnoremap  j                         gj
nnoremap  k                         gk
nnoremap  <Leader>fmt               gg=G<CR>``
nnoremap  gr                        gd[{V%::s/<C-R>///g<Left><Left>
nnoremap  gR                        gD:%s/<C-R>///g<Left><Left>
nnoremap  th                        :tabfirst<CR>
nnoremap  tj                        :tabnext<CR>
nnoremap  tk                        :tabprev<CR>
nnoremap  tl                        :tablast<CR>
nnoremap  tn                        :tabnew<CR>
nnoremap  tq                        :tabclose<CR>
nnoremap  H                         ^
nnoremap  L                         $
vnoremap  L                         g_
inoremap  <C-a>                     <ESC>I
inoremap  <C-e>                     <ESC>A
cnoremap  <C-a>                     <HOME>
cnoremap  <C-e>                     <END>
noremap   j                         gj
noremap   k                         gk
noremap   gj                        j
noremap   gk                        k
nnoremap  gC                        `.
nnoremap  n                         nzzzv
nnoremap  N                         Nzzzv
nnoremap  g;                        g;zz
nnoremap  g,                        g,zz
nnoremap  <C-o>                     <C-o>zz
nnoremap  <silent><leader>il        :set invlist<CR>
vnoremap  <silent><leader>il        :<C-w>set invlist<CR>
inoremap  <C-s>                     <C-o>:%s/
nnoremap  <C-s>                     :%s/
vnoremap  <C-s>                     :s/
nnoremap  /                         /\v
vnoremap  /                         /\v
inoremap  jk                        <ESC>
inoremap  jK                        <ESC>
inoremap  Jk                        <ESC>
inoremap  JK                        <ESC>
vnoremap  <                         <gv
vnoremap  >                         >gv
cnoremap  w!                        w !sudo tee % >/dev/null
tnoremap  <ESC>                     <C-\><C-n>
tnoremap  <Leader><ESC>             <ESC>
" [Keymappings] }}}

" [Autocommands] {{{
"augroup LineReturn
"    au!
"    au BufReadPost *
"        \ if line("'\"") > 0 && line("'\"") <= line("$") |
"        \     execute 'normal! g`"zvzz' |
"        \ endif
"augroup END

augroup ToggleLineNumbers
    au!
    au VimEnter,WinEnter,InsertLeave * setlocal relativenumber
    au WinLeave,InsertEnter * setlocal norelativenumber
augroup END

augroup CursorHighlight
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
    "au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
    "au WinLeave * setlocal nocursorcolumn
    au VimEnter,WinEnter,BufWinEnter * setlocal colorcolumn=+3
    au WinLeave * setlocal colorcolumn=0
augroup END

" reload initrc
"au BufWritePost $MYVIMRC source $MYVIMRC

" save automatically
au FocusLost * :silent! wa

" keep splits equal on terminal resize
au VimResized * :wincmd =

augroup Trailing
    au!
    au InsertEnter * :set invlist
    au InsertLeave * :set invlist
augroup END
" [Autocommands] }}}

" [Colorscheme] {{{
function! ToggleColorscheme()
    if g:colors_name =~ 'seoul256'
        if g:colors_name == 'seoul256'
            colorscheme seoul256-light
        else
            colorscheme seoul256
        endif
    elseif g:colors_name =~ 'Tomorrow'
        if g:colors_name == 'Tomorrow-Night'
            colorscheme Tomorrow
        else
            colorscheme Tomorrow-Night
        endif
    else
        if &background == 'dark'
            set background=light
        else
            set background=dark
        endif
    endif
    AirlineRefresh
endfunction

"   Theme           Range       Default
"   -----           -----       -------
"   seoul256        233 - 239   237
"   seoul256-light  252 - 256   253
let g:seoul256_background       = 237
let g:seoul256_light_background = 254

let g:rehash256 = 1

colorscheme seoul256
"colorscheme molokai
"colorscheme PaperColor
"colorscheme Tomorrow-Night
" [Colorscheme] }}}

