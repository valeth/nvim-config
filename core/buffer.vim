set autowrite
set autoread

command! Wq wq
command! WQ wq
command! Q q
command! W w

" set the history far higher (default 50)
if &history < 1000
	set history=1000
endif

nnoremap U :redo<CR>
nnoremap <C-R> <NOP>

if v:version >= 704
	set undofile
	set undolevels=1000
endif

" write swap file to disk after n millisecs
set updatetime=1500

set switchbuf=useopen,usetab

" more clipboard options
set clipboard=unnamed,unnamedplus,autoselect

" allow explicit writing of read-only files with sudo
cnoremap sudow w !sudo tee % >/dev/null

aug ReadonlyFiles
	au BufNewFile,BufRead /var/log/* set readonly
	au BufNewFile,BufRead /var/log/* set nomodifiable
aug END

if v:version >= 704
    set cryptmethod=blowfish

    au BufReadPost * if &key != "" | set noswapfile nowritebackup viminfo= nobackup noshelltemp history=0 secure | endif
endif
