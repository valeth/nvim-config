set laststatus=2
set noshowmode
"set showtabline=2

"if $TERM != "linux"
    "if executable("powerline")
        "if executable("python3")
            "let $PYTHONPATH="/usr/lib/python3.4/site-packages"
        "elseif executable("python2")
            "let $PYTHONPATH="/usr/lib/python2.7/site-packages"
        "endif
    "endif
"endif

let g:powerline_pycmd  = "py3"
let g:powerline_pyeval = g:powerline_pycmd . "eval"
