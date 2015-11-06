if ! has('nvim')
	set ttimeoutlen=-1
endif

if v:version >= 704
	set undofile

	aug LineNumbers
		au!
		au VimEnter,WinEnter,InsertLeave * setlocal relativenumber
		au WinLeave,InsertEnter * setlocal norelativenumber
	aug END
endif

if has('xterm_clipboard')
	set clipboard=unnamed,unnamedplus,autoselect
endif
