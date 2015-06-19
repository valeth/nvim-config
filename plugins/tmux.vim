if exists('$TMUX')
	function! TmuxOrSplitSwitch(wincmd, tmuxdir)
		let previous_winnr = winnr()
		silent! execute "wincmd " . a:wincmd
		if previous_winnr == winnr()
			call system("tmux select-pane -" . a:tmuxdir)
			redraw!
		endif
	endfunction

	let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
	let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
	let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

	noremap <silent><C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
	noremap <silent><C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
	noremap <silent><C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
	noremap <silent><C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
	noremap <silent><C-b> :call TmuxOrSplitSwitch('b', 'l')<cr>
else
	noremap <C-h> <C-w>h
	noremap <C-j> <C-w>j
	noremap <C-k> <C-w>k
	noremap <C-l> <C-w>l
endif
