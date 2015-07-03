if v:version >= 704
	set formatoptions+="j"
endif

set autoindent
set smarttab

" round the indent to a multiple o shiftwidth
set shiftround

if has('smartindent')
	set smartindent
endif

" enable filetype plugins
if has('autocmd')
	filetype indent on
	filetype plugin on
endif

vnoremap < <gv
vnoremap > >gv

" fix indentation of an entire file
nnoremap <leader>fmt gg=G<CR>``

" local replace
nnoremap gr gd[{V%::s/<C-R>///g<left><left>
nnoremap gR gD:%s/<C-R>///g<left><left>
