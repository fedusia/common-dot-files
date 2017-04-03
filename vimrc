set nocompatible
filetype off                            " required!

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim/      " Set the runtime path to include Vundle

call vundle#begin()                     " Initialize vundle



""------------------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'            " Project and file navigation
Plugin 'majutsushi/tagbar'              " Class/module browser
Plugin 'ctrlpvim/ctrlp.vim'             " Ctrl+p plugin

""------------------=== Other ===-------------------------------
Plugin 'vim-airline/vim-airline-themes' " Lean & mean status/tabline for vim
Plugin 'fisadev/FixedTaskList.vim'      " Pending tasks list
Plugin 'rosenfeld/conque-term'          " Consoles as buffers
Plugin 'tpope/vim-surround'             " Parentheses, brackets, quotes, XML tags, and more

""------------------=== Snippets support ===--------------------
Plugin 'garbas/vim-snipmate'            " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'   " dependencies #1
Plugin 'tomtom/tlib_vim'                " dependencies #2
Plugin 'honza/vim-snippets'             " snippets repo


"---------------=== Languages support ===-------------
"" --- Python ---
Plugin 'klen/python-mode'               " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim'           " Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'            " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim

"" --- Golang ---
Plugin 'fatih/vim-go'
call vundle#end()                       " End of initialization vundle 


filetype on
filetype plugin on
filetype plugin indent on               " required!


"=====================================================
"" General settings
"=====================================================
set tabstop=8                           " size of a hard tabstop
set shiftwidth=4                        " size of an "indent"
set softtabstop=4
set expandtab                           " Always replace tabs with spaces
set smarttab                            " make "tab" insert indents instead of tabs at the beginning of a line
syntax on                               " Turn on color syntax highlighting
set number                              " set number of line
set nowrapscan                          " prevent vim to search from start file when goes to end 
set title                               " Add title to terminal
set ls=2                                " Show line status
set hlsearch                            " Highlight matches in search

"  при переходе за границу в 80 символов в Ruby/Python/js/C/C++ подсвечиваем
"  на темном фоне текст
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

" highlight unwanted spaces
match Error /\s\+$/

" Path to snippets dir
let g:snippets_dir = "~/.vim/vim-snippets/snippets"

" -------=== Settings for NERDTre ===-----------
" Ignore files with etensions:
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" -------=== Settings for Vim-Airline ===-----------
set laststatus=2
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"Key mappings / bindings {
    " ConqueTerm
    " запуск интерпретатора на F5
    nnoremap <F5> :ConqueTermSplit ipython<CR>

    " Bind to F3 to open NERDTree.
    map <F3> :NERDTreeToggle<CR>

    " автокомплит через <Ctrl+Space>
    inoremap <C-space> <C-x><C-o>
    let mapleader=","
    " no more up left rihgt down keys. hjkl motherfucker.
"}
