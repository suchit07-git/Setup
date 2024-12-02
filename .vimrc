set encoding=utf-8
autocmd GUIEnter * call system("wmctrl -ir " . v:windowid . " -b add,maximized_vert,maximized_horz")
autocmd GUIEnter * call system("wmctrl -ir " . v:windowid . " -b add,fullscreen")
set hls
set is
set si
set clipboard=unnamedplus
set ruler
set noswapfile
set noundofile
set backspace=indent,eol,start
set ai
set guifont=Monospace\ Regular\ 13
inoremap { {} <Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}
" autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $
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
autocmd BufNewFile *.cpp 0r ~/template.cpp
autocmd BufNewFile *.cc 0r ~/template.cpp

augroup JavaTemplate
    autocmd!
    autocmd BufNewFile *.java call LoadJavaTemplate()
augroup END

" Function to load the Java template
function! LoadJavaTemplate()
    " Path to the template file
    let l:template_file = expand('~/template.java')

    " Check if the template file exists
    if filereadable(l:template_file)
        " Read the content of the template file
        execute '0r ' . l:template_file
    else
        echo "Template file not found: " . l:template_file
        return
    endif

    " Extract the filename without the extension
    let l:class_name = expand('%:t:r')

    " Replace placeholder __CLASS_NAME__ with the actual class name
    %s/__CLASS_NAME__/\=l:class_name/g

    " Move cursor to a convenient position (line 0, column 0)
    call cursor(0, 0)
endfunction

set softtabstop=4
" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'rhysd/vim-clang-format'
Plugin 'morhetz/gruvbox'
Plugin 'fatih/vim-go'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'preservim/nerdtree'
call vundle#end()
filetype plugin indent on
let g:ycm_show_diagnostics_ui = 0
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_use_clangd = 1
set completeopt=longest,menu
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_auto_trigger = 1
let g:ycm_echo_current_diagnostic = 1
" highlight Cursor guifg=white guibg=black
" set guicursor=n-v-c:block-Cursor
" set guicursor+=i:blinkwait0



autocmd FileType c,cpp,java,scala let b:comment_leader = '//'
autocmd FileType sh,ruby,python   let b:comment_leader = '#'
autocmd FileType conf,fstab       let b:comment_leader = '#'
autocmd FileType tex              let b:comment_leader = '%'
autocmd FileType mail             let b:comment_leader = '>'
autocmd FileType vim              let b:comment_leader = '"'
function! CommentToggle()
    execute ':silent! s/\([^ ]\)/' . escape(b:comment_leader,'\/') . ' \1/'
    execute ':silent! s/^\( *\)' . escape(b:comment_leader,'\/') . ' \?' . escape(b:comment_leader,'\/') . ' \?/\1/'
endfunction
map <C-C> :call CommentToggle()<CR>

if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
endif
" set termguicolors
set background=dark
colorscheme default
" autocmd BufWritePre ~/**.cpp :ruby CppAutoInclude::process
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
