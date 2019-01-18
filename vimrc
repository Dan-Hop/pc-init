"Gotta be first
execute pathogen#infect()
set nocompatible

"---Genral Settings ---
set backspace=indent,eol,start
set noruler
set number
set noshowcmd
set noshowmode
set incsearch
set hlsearch
set paste
set tabstop=4
set shiftwidth=4
set expandtab
set noeol
set nofixendofline

syntax on
filetype plugin indent on

let g:airline#extensions#tabline#enabled = 1 

colorscheme gruvbox
set background=dark

command Fixtab set ts=2 noet | retab! | set et ts=4 | retab
