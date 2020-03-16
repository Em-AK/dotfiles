" Set a compatible shell when vim is launched from fish
if &shell =~# 'fish$'
  set shell=bash
endif

if !has('gui_running')
  set t_Co=256
endif

" Auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" List vim-plug plugins
call plug#begin('~/.vim/plugged')
Plug 'dag/vim-fish'                                " Syntax support for fish scripts
Plug 'guns/vim-sexp'                               " S-expressions manipulation
Plug 'tpope/vim-sexp-mappings-for-regular-people'  " Sexp bindings for terminal use
Plug 'junegunn/rainbow_parentheses.vim'            " Colorfull parenthesis in clojure
Plug 'tpope/vim-fireplace', {'for': 'clojure'}     " Clojure REPL tooling
Plug 'chriskempson/base16-vim'                     " Color scheme
Plug 'junegunn/vim-easy-align'                     " Easy alignment tool
Plug 'tpope/vim-surround'                          " Easy surroundings manipulation
Plug 'tpope/vim-repeat'                            " repeat any command
Plug 'airblade/vim-gitgutter'                      " Git diff line by line
Plug 'itchyny/lightline.vim'                       " Simple statusline/tabline
Plug 'itchyny/vim-gitbranch'                       " Function to get git branch
Plug 'liuchengxu/vim-clap', {'do': ':Clap install-binary'}
call plug#end() " Initialize plugin system

set nocompatible
set number
set relativenumber
set colorcolumn=80
set ruler
let base16colorspace=256
set termguicolors
colorscheme base16-atelier-dune-light
set laststatus=2
set noshowmode
set showmatch " matching parenthesis

" Indentation
set tabstop=2
set shiftwidth=2
set backspace=2
set autoindent
set smartindent
set expandtab
set list
set listchars=trail:·,tab:→→,nbsp:⎵

" Search
set hlsearch
set ignorecase
set smartcase

" Avoid entering the Ex mode by accident
nnoremap Q <Nop>

" Turn on omni-completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Config RainbowParentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]
let g:rainbow#blacklist = [233, 234]
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" Lightline configuration
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" Set readable clap theme
let g:clap_theme = 'material_design_dark'
" emulate Ctrl-P behavior with Clap
nnoremap <C-P> :Clap files<CR>
" grep all files for the word under the cusor
nnoremap <C-F> :Clap grep ++query=<cword><CR>
