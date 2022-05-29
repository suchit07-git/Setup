"set shellslash

"set nocompatible              " be iMproved, required
"filetype off                  " required
"set encoding=utf-8
" set the runtime path to include Vundle and initialize
"set runtimepath+=~/vimfiles/plugged/coc.nvim
set runtimepath+=~/vimfiles/bundle/Vundle.vim
"set runtimepath+=~/vimfiles/bundle/YouCompleteMe
call vundle#begin('~/vimfiles/bundle')
call plug#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'fatih/vim-go'	
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plugin 'ycm-core/YouCompleteMe'
"Plugin 'preservim/nerdtree'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'altercation/vim-colors-solarized'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>
let g:airline_powerline_fonts = 1	
"highlight Cursor guifg=white guibg=black
"set guicursor=n-v-c:block-Cursor
"set guicursor+=i:blinkwait0
"set background=dark
"colorscheme slate
au GUIEnter * simalt ~x
set hls
set is
set gfn=FixedSys:h10
set si
set clipboard=unnamed
set noswapfile
set noundofile
cd C:/Users/SUCHIT/Documents
autocmd BufNewFile *.cpp r C:/Users/SUCHIT/Documents/basic.cpp
"autocmd BufNewFile *.c r C:/Users/SUCHIT/Documents/basic.c
set backspace=indent,eol,start
set ai
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -DDEBUG -Wall -Wextra -std=c++17 -O2 % -o %:r -Wl,--stack,268435456<CR>
autocmd filetype cpp nnoremap <F10> :!%:r<CR>
autocmd filetype java nnoremap <F7> :w <bar> !javac % <CR>
autocmd filetype java nnoremap <F8> :!java %:r <CR>
nnoremap <F5> :w <CR>:!python % <CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

set nu
augroup numbertoggle
  autocmd!
   autocmd BufEnter,FocusGained,InsertLeave * set rnu
   autocmd BufLeave,FocusLost,InsertEnter * set nornu
augroup END

filetype on
filetype plugin on
filetype indent on
syntax on
set softtabstop=2
" Set shift width to 4 spaces.
set shiftwidth=2

" Set tab width to 4 columns.
set tabstop=2

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
"set statusline=

" Status line left side.
"set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
"set statusline+=%=

" Status line right side.
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
"set laststatus=2

" }}}


packadd termdebug
let g:termdebug_popup = 0
let g:termdebug_wide = 163


let g:ycm_semantic_triggers =  {
  \   'c': ['->', '.'],
  \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \            're!\[.*\]\s'],
  \   'ocaml': ['.', '#'],
  \   'cpp,cuda,objcpp': ['->', '.', '::'],
  \   'perl': ['->'],
  \   'php': ['->', '::'],
  \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
  \   'ruby,rust': ['.', '::'],
  \   'lua': ['.', ':'],
  \   'erlang': [':'],
  \ }

let g:ycm_semantic_triggers =  {
  \   'c,cpp,objc': [ 're!\w{3}', '_' ],
  \ }

let g:airline#extensions#tabline#enabled = 0
let g:airline_theme='papercolor'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_use_clangd = 1
set completeopt=longest,menu
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_auto_trigger = 1
let g:ycm_echo_current_diagnostic = 1
"set completeopt-=preview
let g:ycm_global_ycm_extra_conf = 'C:\Users\SUCHIT\vimfiles\bundle\YouCompleteMe\third_party\ycmd\.ycm_extra_conf.py'
