"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                             "
"   Maintainer:   Patrick Auernig <patrick DOT auernig AT gmail DOT com>      "
"   VIM Version:  7.4                                                         "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if ! exists('g:my_vim')
	let g:my_vim=1

	"###################################
	"# XDG config and data directories #
	"###################################

	if exists('$XDG_CONFIG_HOME')
		let g:vim_config_home = expand('$XDG_CONFIG_HOME/vim')
	else
		let g:vim_config_home = expand('$HOME/.config/vim')
	endif

	if !isdirectory(g:vim_config_home)
		call mkdir( g:vim_config_home, 'p', 0700 )
	endif


	if exists('$XDG_CACHE_HOME')
		let g:vim_cache_home = expand('$XDG_CACHE_HOME/vim')
	else
		let g:vim_cache_home = expand('$HOME/.local/cache/vim')
	endif

	if !isdirectory(g:vim_cache_home)
		call mkdir( g:vim_cache_home, 'p', 0700 )
	endif


	if exists('$XDG_DATA_HOME')
		let g:vim_data_home = expand('$XDG_DATA_HOME/vim')
	else
		let g:vim_data_home = expand('$HOME/.local/share/vim')
	endif

	if !isdirectory(g:vim_data_home)
		call mkdir( g:vim_data_home, 'p', 0700 )
	endif


	let l:user_rtp = g:vim_config_home
	let l:runtimepath_old = &runtimepath
	let &runtimepath .= ',' . expand(l:user_rtp)
	let &runtimepath .= ',' . expand(l:user_rtp) . '/after'
	let &runtimepath .= ',' . expand(l:runtimepath_old)


	if $USER == 'root'
		set nobackup
	else
		let &backupdir = g:vim_data_home . '/backup'
		if !isdirectory(expand(&backupdir))
			call mkdir(expand(&backupdir), 'p', 0700)
		endif
	endif


	if $USER == 'root'
		set noswapfile
	else
		let &directory = g:vim_data_home . '/swap'
		if !isdirectory(expand(&directory))
			call mkdir(expand(&directory), 'p', 0700)
		endif
	endif


	if has('mksession')
		let &viewdir = g:vim_data_home . '/views'
		if !isdirectory(expand(&viewdir))
			call mkdir(expand(&viewdir), 'p', 0700)
		endif
	endif


	if has('persistent_undo')
		let &undodir = g:vim_data_home . '/undo'
		if !isdirectory(expand(&undodir))
			call mkdir(expand(&undodir), 'p', 0700)
		endif
	endif


	if has('viminfo')
		set nocompatible
		let &viminfo = "'1000,<50,s10,n" . g:vim_cache_home . '/viminfo'
	endif
endif

" source additional config files
runtime! core/**/*.vim
runtime! plugins/**/*.vim
