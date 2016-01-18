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
" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python2'
let g:syntastic_html_tidy_exec = 'tidy5'
" NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0
" vim-devicons
set encoding=utf8"
