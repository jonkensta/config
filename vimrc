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
set guifont=Inconsolata\ for\ Powerline\ Medium\ 10
" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["html"] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python2'

" Disable annoying errors
let g:syntastic_c_check_header = 0
let g:syntastic_c_no_include_search = 1
let g:syntastic_c_compiler = 'i686-w64-mingw32-gcc'

let g:syntastic_cpp_check_header = 0
let g:syntastic_cpp_no_include_search = 1
let g:syntastic_cpp_compiler = 'i686-w64-mingw32-g++'

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0
" vim-devicons
set encoding=utf8"
