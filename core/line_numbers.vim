set number

if v:version >= 704
    aug LineNumbers
        au!
        au VimEnter,WinEnter,InsertLeave * setlocal relativenumber
        au WinLeave,InsertEnter * setlocal norelativenumber
    aug END
endif
