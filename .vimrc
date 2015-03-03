set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-rails.git'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
" Themes
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'tomasr/molokai'
Bundle 'chriskempson/base16-vim'
Bundle 'slim-template/vim-slim'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'vimclojure'
Plugin 'L9'
Plugin 'FuzzyFinder'
" scripts not on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line

let g:airline_theme='bubblegum'
set incsearch
set hlsearch
syntax enable
filetype plugin on
set omnifunc=syntaxcomplete#Complete
" choose color scheme
let base16colorspace=256
set background=dark
colorscheme base16-default
" colorscheme Tomorrow-Night-Eighties

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set number
set autoindent
set shiftwidth=2
set softtabstop=2
set expandtab

let g:vim_markdown_folding_disabled=1
