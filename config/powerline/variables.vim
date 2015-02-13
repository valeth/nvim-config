"if $TERM != "linux"
    "if executable("powerline")
        "if executable("python3")
            "let $PYTHONPATH="/usr/lib/python3.4/site-packages"
        "elseif executable("python2")
            "let $PYTHONPATH="/usr/lib/python2.7/site-packages"
        "endif
    "endif
"endif

"let g:powerline_pycmd = "py3"
