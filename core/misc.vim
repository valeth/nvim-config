set backspace=indent,eol,start
set complete-=i
set nrformats-=octal
set shiftround
set display+=lastline
set showmatch
set shortmess=aoOtTI
set autochdir
set report=0
set updatetime=1500
set switchbuf=useopen,usetab
set pumheight=10
set diffopt+=context:3
set matchtime=2

" set the terminal colors to 256 if not in a VT
if exists($TERM)
	if &t_Co == 8 && $TERM !~# '^linux'
		set t_Co=256
	endif
endif

if &listchars ==# 'eol:$'
	set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" load the matchit macros
if !exists('g:loaded_matchit') && findfile('plugins/matchit.vim', &rtp) ==# ''
	runtime! macros/matchit.vim
endif


