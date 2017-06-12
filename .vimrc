"A simple vimrc that I give to people just starting to use Vim."

" External plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim' "Color scheme
Plug 'itchyny/lightline.vim' "Vim status line
Plug 'ctrlpvim/ctrlp.vim' "Fuzzy finder
Plug 'craigemery/vim-autotag' "Re-run ctags on buffer write
Plug 'junegunn/goyo.vim' "Distraction free writing
Plug 'junegunn/limelight.vim' "Huperfocus writing in vim
Plug 'tpope/vim-fugitive' "Git wrapper
Plug 'airblade/vim-gitgutter' "Git diff line by line
Plug 'edkolev/tmuxline.vim' "Tmux integration with vim colors
Plug 'vim-syntastic/syntastic' "Syntax checking
" Add plugins to &runtimepath
call plug#end()


" Basic settings
set nocompatible "Fixes old Vi bugs
syntax on
set backspace=2 "Makes backspace work
set history=500 "Sets undo history size
set ruler "Sets up status bar
set laststatus=2 "Always keeps the status bar active
set noshowmode "get rid of the default vim mode information 
set number "Turns on line numbering
set relativenumber "Numbering lines relative to the current line
set t_Co=256 "Sets Vim to use 256 colors
set updatetime=300


" Lightline configuration
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LLFugitive',
      \   'filename': 'LLFilename',
      \   'fileformat': 'LLFileformat',
      \   'filetype': 'LLFiletype',
      \   'fileencoding': 'LLFileencoding',
      \   'mode': 'LLMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LLFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LLReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LLModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LLFilename()
  return ('' != LLReadonly() ? LLReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LLModified() ? ' ' . LLModified() : '')
endfunction

function! LLFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LLFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LLFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LLMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


" Unified color scheme (default: dark)
colo seoul256
" Light color scheme
colo seoul256-light
" Switch
set background=dark
"set background=light


" Goyo hyper focus mode with LimeLight
autocmd! User GoyoEnter Limelight 0.7
autocmd! User GoyoLeave Limelight!


" Syntastic configuration
let g:syntastic_javascript_checkers = ['jslint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1


" Indentation settings
set tabstop=2 "Sets display width of tabs
set shiftwidth=2 "Sets indentation width
set autoindent "Turns on auto-indenting
set smartindent "Remembers previous indent when creating new lines
"Choose between tabs and spaces for indentation by uncommenting one of
"these two. Expand for spaces, noexpand for tabs:"
"set noexpandtab
set expandtab
 

" Search settings
set hlsearch "Highlights search terms
set showmatch "Highlights matching parentheses
set ignorecase "Ignores case when searching
set smartcase "Unless you put some caps in your search term


" Key mappings
"Avoid entering the Ex mode by accident
nnoremap Q <Nop>


"Turn on plugin & indentation support for specific filetypes
filetype plugin indent on

