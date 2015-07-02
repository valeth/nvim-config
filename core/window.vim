" split the windows more 'naturally'
if has('windows')
	set splitbelow
	set splitright
	set showtabline=2
endif


" set scroll offset slightly higher so that the next or previous line can be seen
if !&scrolloff
	set scrolloff=1
endif

" same as with scroll offset but for horizontal scrolling
if !&sidescrolloff
	set sidescrolloff=5
endif

set number

if v:version >= 704
	aug LineNumbers
		au!
		au VimEnter,WinEnter,InsertLeave * setlocal relativenumber
		au WinLeave,InsertEnter * setlocal norelativenumber
	aug END
endif

if has('linebreak')
	let &showbreak = '↳ '
	set breakindent
	set breakindentopt=sbr
endif

" show a ruler and show the current command in the bottom right
if has('cmdline_info')
	set ruler
	set showcmd
endif

" show invisible characters
set listchars=tab:»\ ,trail:◆,extends:▹,precedes:◃,eol:↲,nbsp:·

nnoremap <silent> <leader>il :set invlist<CR>
vnoremap <silent> <leader>il :<C-W>set invlist<CR>

if has('wildmenu')
	set wildmenu
	set wildmode=list:longest,full
	set wildignore=.bak,.old,.swp,~
endif

" maximum height of a popup menu
set pumheight=10

" allow the cursor to be positioned where no characters are in virtual block mode 
if has('virtualedit')
	set virtualedit=block
endif

" enable syntax highlighting
if has('syntax')
	syntax enable
endif

" set via $LANG
"if has('multi_byte')
	"set encoding=utf-8
	"set termencoding=utf-8
"endif

" always show a status line
set laststatus=2

" show as much as possible of the last line
set display+=lastline

" show matching brackets
set showmatch
set matchtime=2

" shorten some messages
set shortmess=aoOtTI

" set the terminal colors to 256 if not in a VT
if exists($TERM)
	if &t_Co == 8 && $TERM !~# '^linux'
		set t_Co=256
	endif
endif

aug CursorLineColumn
	au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
	au WinLeave * setlocal nocursorline nocursorcolumn
aug END

" disable visualbell
set visualbell
set t_vb=
