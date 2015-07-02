let g:syntastic_enable_signs = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_c_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_tex_checkers = ["false"]

let g:syntastic_error_symbol = '!'
let g:syntastic_warning_symbol = '?'

nnoremap <leader>syn :SyntasticToggleMode<CR>
vnoremap <leader>syn <ESC>:SyntasticToggleMode<CR>
