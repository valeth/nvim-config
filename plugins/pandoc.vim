" the filetypes for which vim-pandoc should be used
let g:pandoc#filetypes#handles = [ "pandoc", "markdown" ]

" enable pandoc for markdown
let g:pandoc#filetypes#pandoc_markdown = 1

" disable the spellchecker
let g:pandoc#spell#enabled = 0

" don't use the conceal functionality
let g:pandoc#syntax#conceal#use = 0

" would you please use the defined foldcolums settings, thanks
let g:pandoc#folding#fdc = &fdc
