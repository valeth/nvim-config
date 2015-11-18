function! myfold#text()
    " get actual numberwidth of the current document
    let nw_add = (len(line('$')) - (&numberwidth - 1))
    if nw_add > 0
        let nw = &numberwidth + nw_add
    else
        let nw = &numberwidth
    endif

    let numfold_w =(nw * &number) + &foldcolumn
    let window_w = winwidth(0) - numfold_w
    let onetab = strpart('          ', 0, &tabstop)

    let foldtxt_start = getline(v:foldstart) . '  …'
    let foldtxt_start = substitute(foldtxt_start, '\t', onetab, 'g')
    let foldtxt_start_w = len(foldtxt_start) - 2

    let foldtxt_end = '+' . string(foldclosedend(v:foldend) - foldclosed(v:foldstart)) . '         '
    let foldtxt_end_w = len(foldtxt_end)

    let foldtxt_mid_w = window_w - (foldtxt_start_w + foldtxt_end_w)
    let foldtxt_mid = repeat(' ', foldtxt_mid_w + 2)

    return foldtxt_start . foldtxt_mid . foldtxt_end
endfunction
