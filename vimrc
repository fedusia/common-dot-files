set nocompatible              " be iMproved, required
filetype off                  " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'		" let Vundle manage Vundle, required
Plugin 'saltstack/salt-vim'

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree' 	    	" Project and file navigation
"Plugin 'majutsushi/tagbar'          	" Class/module browser

"------------------=== Other ===----------------------
Plugin 'vim-airline/vim-airline'   	    	" Lean & mean status/tabline for vim
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'fisadev/FixedTaskList.vim'  	" Pending tasks list
"Plugin 'rosenfeld/conque-term'      	" Consoles as buffers
"Plugin 'tpope/vim-surround'	   	" Parentheses, brackets, quotes, XML tags, and more

"--------------=== Snippets support ===---------------
"Plugin 'garbas/vim-snipmate'		" Snippets manager
"Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
"Plugin 'tomtom/tlib_vim'		" dependencies #2
"Plugin 'honza/vim-snippets'		" snippets repo

"---------------=== Languages support ===-------------
" --- Python ---
"Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
"Plugin 'davidhalter/jedi-vim' 		" Jedi-vim autocomplete plugin
"Plugin 'mitsuhiko/vim-jinja'		" Jinja support for vim
"Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}



" linting
Plugin 'dense-analysis/ale'

call vundle#end()            		" required

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8


filetype on
filetype plugin on
filetype plugin indent on

"let g:snipMate = { 'snippet_version' : 1 }


" Tturn on syntax highlight
syntax on
:set number
:set colorcolumn=120

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

" ==== NERDTree ==== https://github.com/preservim/nerdtree
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" ==== NERDTree END ====


let g:pymode_python = 'python3'
let b:ale_python_auto_virtualenv = 1
let g:ale_virtualenv_dir_names = ["/Users/fedusia/work/venvs/vim"]

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checkers = "pylint,pyflakes,mccabe,pep8"
let g:pymode_lint_config = '$HOME/pylint.rc'

let g:pymode_options_max_line_length = 120
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_lint_options_pylint = {'max-line-length': g:pymode_options_max_line_length}
let g:pymode_lint_options_pyflakes = { 'builtins': '_' }
let g:ale_python_flake8_options = '--max-line-length=120'
let g:ale_fixers = {'python': ['isort'],}
let g:ale_fix_on_save = 0


set expandtab
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start

let g:airline_powerline_fonts = 1
