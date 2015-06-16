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
