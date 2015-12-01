set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'
Plug 'kien/ctrlp.vim'
Plug 'spf13/vim-autoclose'
Plug 'janko-m/vim-test'
Plug 'elixir-lang/vim-elixir'
Plug 'ntpeters/vim-better-whitespace'
Plug 'evidens/vim-twig'
call plug#end()

set number
set linebreak
set showbreak=+++
set textwidth=100
set showmatch	
set visualbell
 
set hlsearch
set smartcase
set ignorecase	
set incsearch
 
set autoindent
set expandtab	
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
 
set ruler	
set colorcolumn=80
set autowriteall
set undolevels=1000
set backspace=indent,eol,start

let base16colorspace=256
set background=dark
colorscheme base16-default
