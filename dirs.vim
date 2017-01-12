let g:vim_config_home = split(&rtp, ',', 0)[0]

if exists('$XDG_CACHE_HOME')
    let g:vim_cache_home = expand('$XDG_CACHE_HOME/') . v:progname
else
    let g:vim_cache_home = expand('$HOME/.local/cache/') . v:progname
endif

if exists('$XDG_DATA_HOME')
    let g:vim_data_home = expand('$XDG_DATA_HOME/') . v:progname
else
    let g:vim_data_home = expand('$HOME/.local/share/') . v:progname
endif
