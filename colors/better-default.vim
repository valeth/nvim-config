" Vim color file

hi clear Normal
set bg&

hi clear

hi CursorLine cterm=NONE

hi SignColumn ctermbg=NONE

hi FoldColumn ctermbg=NONE

if exists("syntax_on")
  syntax reset
endif

let colors_name = "better-default"

" vim: sw=2
