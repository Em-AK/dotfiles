"A simple vimrc that I give to people just starting to use Vim."

" External plugins
call plug#begin('~/.vim/plugged')
                                        "## Color schemes
Plug 'junegunn/seoul256.vim'
Plug 'chriskempson/base16-vim'

                                        "## Basic utils
Plug 'ctrlpvim/ctrlp.vim'               " Fuzzy finder
Plug 'gabesoft/vim-ags'                 " Search the codebase
Plug 'tpope/vim-fugitive'               " Git wrapper
Plug 'airblade/vim-gitgutter'           " Git diff line by line
Plug 'godlygeek/tabular'                " Text alignment tool
Plug 'vim-syntastic/syntastic'          " Syntax checking
Plug 'craigemery/vim-autotag'           " Re-run ctags on buffer write

                                        "## Tests
Plug 'janko-m/vim-test'                 " Run your tests without leaving vim
Plug 'benmills/vimux'                   " Display strategy for vim-test
Plug 'tpope/vim-dispatch'               " Display strategy for vim-test

                                        "## Frame
Plug 'itchyny/lightline.vim'            " Vim status line
Plug 'edkolev/tmuxline.vim'             " Tmux integration with vim colors
Plug 'nathanaelkane/vim-indent-guides'  " display indentation guides

                                        "## Prose writing
Plug 'junegunn/goyo.vim'                " Distraction free writing
Plug 'junegunn/limelight.vim'           " Huperfocus writing in vim

                                        "## Language syntax support
Plug 'editorconfig/editorconfig-vim'
Plug 'lumiliet/vim-twig'                " Twig support
Plug 'slim-template/vim-slim'           " Slim templates support
Plug 'urbit/hoon.vim'                   " Hoon syntax support
Plug 'slim-template/vim-slim'           " slim templating syntax
Plug 'kchmck/vim-coffee-script'         " coffeescript support

                                        "## Clojure toolchain
Plug 'junegunn/rainbow_parentheses.vim' " colorfull parenthesis in clojure
Plug 'tpope/vim-fireplace'              " Clojure REPL support
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


" Color scheme
"
" Seoul
"colo seoul256
"set background=dark
"
"colo seoul256-light
"set background=light
"
" Base16
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-bespin


"vim indent guides config
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2

"Manually set indent guide colors
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=18

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


"Vertical color column at 80 char
set colorcolumn=80


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
set list
set listchars=trail:·,tab:→→,nbsp:⎵


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
"Turn on omni-completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete


" EditorConfig config
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']


" Config vim-test
if !empty(glob("docker-compose.yml"))
  let test#ruby#rspec#executable = 'docker exec -it spring spring rspec'
end

let g:test#runner_commands = ['RSpec']
let test#strategy = "vimux"

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> tn :TestNearest<CR> " t n
nmap <silent> tf :TestFile<CR>    " t f
nmap <silent> ts :TestSuite<CR>   " t s
nmap <silent> tl :TestLast<CR>    " t l
nmap <silent> tg :TestVisit<CR>   " t g
nmap <silent> ta :RSpec spec/acceptance --format RspecApiDocumentation::ApiFormatter<CR> " t a



" Config RainbowParentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]

" List of colors that you do not want. ANSI code or #RRGGBB
let g:rainbow#blacklist = [233, 234]

" Activate RainbowParentheses based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

