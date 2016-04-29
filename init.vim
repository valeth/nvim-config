" Maintainer:   Patrick Auernig <patrick DOT auernig AT gmail DOT com>
" VIM Version:  NVIM 0.1.4
" Source:       https://gitlab.com/valeth/vim-config
" Mirror:       https://github.com/valeth/vim-config


" XDG Directories           {{{
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
" }}}

" Settings                  {{{

" prompt with save dialog on exit
set confirm

" wait only a short amount of time
set notimeout
set ttimeout
set timeoutlen=10
set visualbell t_vb=

" automatically do stuff
set autochdir
set autoread
set autowriteall

" scroll n lines before hitting the border
set scrolloff=3
set sidescrolloff=5

" show line numbers
set number

" show position
set ruler

" ignore case when searching
set ignorecase
set smartcase
set incsearch
set gdefault

" show matching parenthesis
set showmatch
set matchtime=3


" show hidden characters
set listchars=tab:»\ ,trail:◆,extends:❯,precedes:❮,eol:↲,nbsp:·
set breakindent
set breakindentopt=sbr
set showbreak=↳
set list

set shortmess=aoOtTI

" share yank buffer with system clipboard
set clipboard+=unnamed

" indent automatically
set autoindent
set smartindent

set undofile

set noswapfile

" change split behaviour
set splitbelow
set splitright

" show sane line lenght limit marker
set colorcolumn=+3

" wildmenu completion
set wildmenu
set wildmode=list:longest,full
set wildignore+=.git
set wildignore+=*.bak,*.old,*.swp,*~
set wildignore+=*.o,*.hi
set wildignore+=*.pyc,*.class
set wildignore+=*.pdf,*.aux
set wildignore+=*.png,*.jpg

set virtualedit+=block

set foldcolumn=1
set foldlevel=99
set foldmethod=syntax
set foldtext=myfold#text()

set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" enable syntax highlighting and filetype detection
filetype indent on
filetype plugin on
syntax enable
set synmaxcol=300
" }}}

" Keyboard mappings         {{{
let g:mapleader = ","
let g:maplocalleader = "\\"

command! Wq wq
command! WQ wq
command! Q q
command! W w

noremap <silent> <Leader><CR> :noh<CR>

nnoremap U :redo<CR>
nnoremap <C-R> <NOP>
nnoremap <Leader>vl :setlocal cursorline!<CR>
nnoremap <Leader>vc :setlocal cursorcolumn!<CR>
nnoremap <Leader>ve :setlocal colorcolumn=80<CR>
nnoremap <Leader>vn :setlocal colorcolumn=0<CR>
nnoremap <Leader>tcs :call ToggleColorscheme()<CR>
nnoremap Y y$
nnoremap j gj
nnoremap k gk
nnoremap <leader>fmt gg=G<CR>``
nnoremap gr gd[{V%::s/<C-R>///g<left><left>
nnoremap gR gD:%s/<C-R>///g<left><left>
nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<CR>
nnoremap tq :tabclose<CR>

nnoremap <CR> o<ESC>

" change beginning and end mappings
noremap H ^
noremap L $
vnoremap L g_
inoremap <C-a> <ESC>I
inoremap <C-e> <ESC>A
cnoremap <C-a> <HOME>
cnoremap <C-e> <END>

" movement
noremap j gj
noremap k gk
noremap gj j
noremap gj j

" go to last change
nnoremap gC `.

" stay in center when searching
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <C-o> <C-o>zz

" toggle invlist
nnoremap <silent> <leader>il :set invlist<CR>
vnoremap <silent> <leader>il :<C-W>set invlist<CR>

" make substitutions more convenient
nnoremap <C-s> :%s/
vnoremap <C-s> :s/

nnoremap / /\v
vnoremap / /\v

" quicker escape
inoremap jk <ESC>
inoremap JK <ESC>
inoremap Jk <ESC>

" indent in visual mode and keep selection
vnoremap < <gv
vnoremap > >gv

" just in case I forgot sudo again
cnoremap w! w !sudo tee % >/dev/null

tnoremap <ESC> <C-\><C-n>
tnoremap <leader><ESC> <ESC>

" NOP(E)s
noremap <F1> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
" }}}

" Autocommands              {{{
augroup LineReturn
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

augroup ToggleLineNumbers
    au!
    au VimEnter,WinEnter,InsertLeave * setlocal relativenumber
    au WinLeave,InsertEnter * setlocal norelativenumber
augroup END

augroup CursorLineColumn
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
    au WinLeave * setlocal nocursorline nocursorcolumn
augroup END

augroup AutoReload
    au!
    au BufWritePost $MYVIMRC source $MYVIMRC
augroup END

au FocusLost * :silent! wa

" keep splits equal on terminal resize
au VimResized * :wincmd =

augroup Trailing
    au!
    au InsertEnter * :set invlist
    au InsertLeave * :set invlist
augroup END
" }}}

" Plugins                   {{{
call plug#begin(g:vim_data_home . '/plugins')

" deoplete                  {{{
" run 'UpdateRemotePlugins' first
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neoinclude.vim', { 'for': ['c', 'cpp'] }
Plug 'Rip-Rip/clang_complete', { 'for': ['c', 'cpp'] }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }

let g:deoplete#enable_at_startup = 1
" }}}

" ctrlp.vim                 {{{
Plug 'kien/ctrlp.vim'

let g:ctrlp_cmd = "CtrlPBuffer"
let g:ctrlp_prompt_mappings = {
    \ 'ToggleType(1)':        ['<c-l>', '<c-f>', '<c-up>'],
    \ 'ToggleType(-1)':       ['<c-h>', '<c-b>', '<c-down>'],
\ }
" }}}

" Gundo                     {{{
Plug 'vim-scripts/Gundo', { 'on': 'GundoToggle' }

let g:gundo_width = 60
let g:gundo_preview_height = 30
let g:gundo_right = 1

nnoremap <silent> <leader>gu :GundoToggle<CR>
vnoremap <silent> <leader>gu <ESC>:GundoToggle<CR>
" }}}

" latexsuite                {{{
set grepprg=grep\ -nH\ $*

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

nnoremap <SID> <Plug>Tex_Help
inoremap <SID> <Plug>Tex_Help
nnoremap <SID> <Plug>IMAP_JumpForward
vnoremap <SID> <Plug>IMAP_JumpForward
"noremap <buffer> <F5> :w<CR> :!pdflatex -shell-escape "%" && { pgrep ".*%:p || xdg-open %:p:r.pdf }<CR>
" }}}

" nerdtree                  {{{
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

au bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

noremap  <silent> <leader>nt :NERDTreeToggle<CR>
vnoremap <silent> <leader>nt <ESC>:NERDTreeToggle<CR>
" }}}

" syntastic                 {{{
Plug 'scrooloose/syntastic', {'for': ['c', 'cpp', 'python', 'sh']}

let g:syntastic_enable_signs = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_c_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_tex_checkers = ["false"]
let g:syntastic_error_symbol = '!'
let g:syntastic_warning_symbol = '?'
nnoremap <leader>syn :SyntasticToggleMode<CR>
vnoremap <leader>syn <ESC>:SyntasticToggleMode<CR>
" }}}

" tagbar                    {{{
Plug 'majutsushi/tagbar'

nnoremap <silent> <leader>tag :TagbarToggle<CR>
vnoremap <silent> <leader>tag <ESC>:TagbarToggle<CR>
" }}}

" powerline/airline         {{{
Plug 'bling/vim-airline'

"set showtabline=2
set laststatus=2
set noshowmode

"let g:powerline_pycmd  = "py3"
"let g:powerline_pyeval = g:powerline_pycmd . "eval"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
" }}}

" scratch.vim               {{{
Plug 'mtth/scratch.vim', { 'on': 'Scratch' }

" allow autohiding
set hidden

let g:scratch_persistence_file = g:vim_data_home . "/scratch.vim"
" }}}

" vim-pandoc                {{{
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" the filetypes for which vim-pandoc should be used
let g:pandoc#filetypes#handles = [ "markdown", "pandoc" ]

" enable pandoc for markdown
let g:pandoc#filetypes#pandoc_markdown = 1

" disable the spellchecker
let g:pandoc#spell#enabled = 0

" don't use the conceal functionality
let g:pandoc#syntax#conceal#use = 0

" would you please use the defined foldcolums settings, thanks
let g:pandoc#folding#fdc = &fdc
" }}}

" vim-tmux-navigator        {{{
Plug 'christoomey/vim-tmux-navigator'

" use Alt instead of Ctrl
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-\> :TmuxNavigatePrevious<cr>
" }}}

Plug 'Konfekt/FastFold'
Plug 'Raimondi/delimitMate'
Plug 'vim-scripts/fish-syntax'
Plug 'valeth/sprak.vim', { 'for': 'sprak' }
Plug 'hoelzro/vim-polyglot'
Plug 'vim-scripts/gnupg'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive', { 'on': ['Gstatus', 'Gcommit']}
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'tomasr/molokai'
Plug 'junegunn/seoul256.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'chriskempson/tomorrow-theme'
call plug#end()
" }}}

" Colorscheme               {{{
function! ToggleColorscheme()
    if g:colors_name =~ 'seoul256'
        call ToggleSeoul256()
    elseif g:colors_name =~ 'Tomorrow'
        call ToggleTomorrow()
    else
        call ToggleBackground()
    endif

    AirlineRefresh
endfunction

function! ToggleBackground()
        if &background == 'dark'
            set background=light
        else
            set background=dark
        endif
endfunction

function! ToggleSeoul256()
    if g:colors_name == 'seoul256'
        colorscheme seoul256-light
    else
        colorscheme seoul256
    endif
endfunction

function! ToggleTomorrow()
    if g:colors_name == 'Tomorrow-Night'
        colorscheme Tomorrow
    else
        colorscheme Tomorrow-Night
    endif
endfunction

"let g:molokai_original = 1
"let g:rehash256 = 1
"colorscheme molokai

"   Theme           Range       Default
"   -----           -----       -------
"   seoul256        233 - 239   237
"   seoul256-light  252 - 256   253
let g:seoul256_background       = 237
let g:seoul256_light_background = 254
colorscheme seoul256

"colorscheme PaperColor

"colorscheme Tomorrow-Night
" }}}

" vim:set foldmethod=marker foldlevel=0:
