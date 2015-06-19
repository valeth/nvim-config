set ignorecase
set smartcase

" highlight searches and search while typing
if has('extra_search')
	set hlsearch
	set incsearch
	if maparg('<C-L>', 'n') ==# ''
		nnoremap <silent><C-L> :nohlsearch<CR><C-L>
	endif
endif

" load the matchit macros
if !exists('g:loaded_matchit') && findfile('plugins/matchit.vim', &rtp) ==# ''
	runtime! macros/matchit.vim
endif
