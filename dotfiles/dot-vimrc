" load in plugins
execute pathogen#infect()
" set a tasteful background
colorscheme desert
" syntax highlighting
syntax on
autocmd BufNewFile,BufRead SConstruct set syntax=python
autocmd BufNewFile,BufRead SConscript set syntax=python
" omnicomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
" activates indenting for files
filetype plugin indent on
" git commit body limited to 72 characters
au FileType gitcommit set tw=72
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
" vim-devicons
set encoding=utf8"
" ignore generated files
set wildignore=*.o,*~,*.pyc
" disable scrollbars in GUI mode
set guioptions+=LlrRb
set guioptions-=LlrRb
"set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guifont=Inconsolata\ 12
" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["html"] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python'


" Disable annoying errors
let g:syntastic_c_check_header = 0
let g:syntastic_c_no_include_search = 1
let g:syntastic_c_compiler = 'i686-w64-mingw32-gcc'

let g:syntastic_cpp_check_header = 0
let g:syntastic_cpp_no_include_search = 1
let g:syntastic_cpp_compiler = 'i686-w64-mingw32-g++'

map <C-n> :Explore<CR>
set tags+=tags;

" Options for vimdiff
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
