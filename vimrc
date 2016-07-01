" Base settings:
set tabstop=2                  " size of a hard tabstop
set shiftwidth=2               " size of an "indent"
set expandtab                  " Always uses spaces instead of tab characters
set smarttab                   " make "tab" insert indents instead of tabs at the beginning of a line
syntax on                      " Turn on color syntax highlighting
set number                     " set number of line
set nowrapscan                 " prevent vim to search from start file when goes to end 
set title                      " Add title to terminal

set nocompatible
filetype off                   " necessarily!

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

filetype plugin indent on      " necessarily!

"Reposittories from  github.com
Plugin 'ctrlpvim/ctrlp.vim'
