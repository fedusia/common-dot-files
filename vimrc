" Base settings:
set tabstop=8                  " size of a hard tabstop
set shiftwidth=4               " size of an "indent"
set softtabstop=4
set expandtab                  " Always replace tabs with spaces
set smarttab                   " make "tab" insert indents instead of tabs at the beginning of a line
syntax on                      " Turn on color syntax highlighting
set number                     " set number of line
set nowrapscan                 " prevent vim to search from start file when goes to end 
set title                      " Add title to terminal

set nocompatible
filetype off                   " necessarily!

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#begin()


"Reposittories from  github.com
Plugin 'ctrlpvim/ctrlp.vim'

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'           " Project and file navigation
Plugin 'majutsushi/tagbar'             " Class/module browser
"
""------------------=== Other ===----------------------
Plugin 'bling/vim-airline'              " Lean & mean status/tabline for vim
Plugin 'fisadev/FixedTaskList.vim'      " Pending tasks list
Plugin 'rosenfeld/conque-term'          " Consoles as buffers
Plugin 'tpope/vim-surround'     " Parentheses, brackets, quotes, XML tags, and more

"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'       " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'  " dependencies #1
Plugin 'tomtom/tlib_vim'       " dependencies #2
Plugin 'honza/vim-snippets'        " snippets repo


"---------------=== Languages support ===-------------
"" --- Python ---
Plugin 'klen/python-mode'           " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim'       " Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'        " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim

call vundle#end()              " required


filetype on
filetype plugin on
filetype plugin indent on      " necessarily!


" Bind to CTRL+M NERDTree.
map <C-n> :NeRDTreeToggle<CR>
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
