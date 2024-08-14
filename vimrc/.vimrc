" Enable relative line numbers
set relativenumber
set number

set tabstop=8
set shiftwidth=8
set expandtab

let g:rehash256 = 1 
" let g:molokai_original = 1 
highlight NonText guibg=#060606 
highlight Folded  guibg=#0A0A0A guifg=#9090D0 
set t_Co=256 
" set background=dark 
" colorscheme  molokai

" Enable syntax highlighting
syntax on

" Enable line highlighting for the current line
set cursorline

" Set a more friendly backspace behavior
set backspace=indent,eol,start

" Enable auto-indentation
set autoindent
set smartindent

" Enable incremental search
set incsearch

" Enable search highlighting
set hlsearch

" Ignore case in search patterns
set ignorecase

" Override the 'ignorecase' option if the search pattern contains uppercase letters
set smartcase

" Show matching brackets when text indicator is over them
set showmatch

" Enable mouse support in all modes
set mouse=a

" Set file encoding to UTF-8
set encoding=utf-8

" Set the color scheme (you can choose any color scheme you prefer)

" Enable line wrapping
set wrap

" Show command in the last line of the screen
set showcmd

" Show (partial) command you type in the last line of the screen
set showmode

" Display the incomplete command in the status line
set showmatch

" Enable clipboard support (requires Vim to be compiled with +clipboard)
set clipboard=unnamedplus

" Display the status line always
set laststatus=2

" Split windows to appear below and to the right
set splitbelow
set splitright

" Reduce the time for Vim to respond to mapped key sequences
set timeoutlen=500

" Display line numbers
set number

" Highlight current line number
set cursorline

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
