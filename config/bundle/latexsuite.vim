set grepprg=grep\ -nH\ $*

let g:tex_flavor               = "latex"
let g:tex_fold_enabled         = 1
let g:Imap_UsePlaceHolders     = 0
let g:Tex_ViewRule_dvi         = ""
let g:Tex_ViewRule_ps          = ""
let g:Tex_ViewRule_pdf         = ""
let g:Tex_ViewRuleComplete_dvi = "pgrep okular.*$* || xdg-open &"
let g:Tex_ViewRuleComplete_ps  = ""
let g:Tex_ViewRuleComplete_pdf = "pgrep okular.*$* || xdg-open &"
let g:Tex_DefaultTargetFormat  = "pdf"

nnoremap <SID> <Plug>Tex_Help
inoremap <SID> <Plug>Tex_Help
nnoremap <SID> <Plug>IMAP_JumpForward
vnoremap <SID> <Plug>IMAP_JumpForward
"noremap <buffer> <F5> :w<CR> :!pdflatex -shell-escape "%" && { pgrep ".*%:p || xdg-open %:p:r.pdf }<CR>
