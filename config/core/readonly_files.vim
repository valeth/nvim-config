aug ReadonlyFiles
    au BufNewFile,BufRead /var/log/* set readonly
    au BufNewFile,BufRead /var/log/* set nomodifiable
aug END
