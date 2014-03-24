" load in plugins
execute pathogen#infect()
" set a tasteful background
colorscheme desert
" syntax highlighting
syntax on
" activates indenting for files
filetype plugin indent on
" auto indenting
set autoindent
" line numbers
set number
" backspace in insert mode works like normal editor
set backspace=2
" expand tabs with 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
" do not wrap
set nowrap
" show end of line characters
set list
" display cursor line and column number in status
set ruler
" remove annoying swap files and ~files
set noswapfile
set nobackup
" disable scrollbars in GUI mode
set guioptions+=LlrRb
set guioptions-=LlrRb
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar

" grep will sometimes skip displaying the file name if you search in a singe
" file. This will confuse Latex-Suite. Set your grep program to always
" generate a file-name.
set grepprg=grep\ -nH\ $*

" Starting with Vim 7, the filetype of empty .tex files defaults to 'plaintex'
" instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
