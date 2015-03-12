"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                             "
"   Maintainer:   Patrick Auernig <patrick DOT auernig AT gmail DOT com>      "
"   VIM Version:  7.4                                                         "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"runtime bundle/unbundle/unbundle.vim
runtime bundle/pathogen/autoload/pathogen.vim

execute pathogen#infect()

runtime! config/core/**/*.vim
runtime! config/bundle/**/*.vim
