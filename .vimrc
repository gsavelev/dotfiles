" Use Vim settings, rather then Vi settings
set nocompatible

" Set bigger history of executed commands
set history=1000

" Always show cursor position
set ruler

" Disable beep on errors
set noerrorbells

" Flash the screen instead of beeping on errors
set visualbell

" Set directory where Vim will try to store swap files
set directory=$HOME/.vim/swp//

" Disable backup files
set nobackup

" Pathogen package manager
execute pathogen#infect()
filetype plugin indent on

" String enumeration
set number
" Set relative numbers
set relativenumber
" Enable relative numbers only in Normal mode, and absolute numbers only in Insert mode
augroup toggle_relative_number
autocmd InsertEnter * :setlocal norelativenumber
autocmd InsertLeave * :setlocal relativenumber

" -- STATUS LINE --
" Show status line
set laststatus=2

" Tail of the filename
set statusline=%t

" File format
set statusline+=\ %{&ff}

" Help file flag
set statusline+=%h

" Modified flag
set statusline+=%m

" Read only flag
set statusline+=%r

" File type
set statusline+=%y

" Cursor column
set statusline+=\ %c,

" Cursor line/total lines
set statusline+=%l/%L

" Percent through file
set statusline+=\ %P

" Highlight patterns in search
set hlsearch

" Find the next match as we type the search
set incsearch

" Ignore case when searching
set ignorecase

" . . . unless you type a capital
set smartcase

" New lines inherit the indentation of previous lines
set autoindent

" Number of tabulation indents
set tabstop=4

" Indent size
set shiftwidth=4

" Tab-indent size
set smarttab

" On pressing tab, insert 4 spaces
set expandtab

" Don’t wrap lines
set nowrap

" -- TEXT RENDERING OPTIONS --
" Use an encoding that supports Unicode
set encoding=utf-8

" Wrap lines at convenient points
set linebreak

" The number of screen lines to keep above and below the cursor
set scrolloff=5

" The number of screen columns to keep to the left and right of the cursor
set sidescrolloff=5

" Syntax highlighting
syntax on

" MISCELLANEOUS OPTIONS
" Display a confirmation dialog when closing an unsaved file
set confirm

" Ignore file’s mode lines; use vimrc configurations instead
set nomodeline

" Maintain undo history between sessions
set undofile

" Set undo directory
set undodir=~/.vim/undodir

" Silent message like E45: 'readonly' option is set (add ! to override) by Ex command w!!
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" -- EMMET CONFIG --
" redefine trigger key
let g:user_emmet_leader_key=','

" Open files in split window
let g:netrw_browse_split = 4

" Set new split window size at 80%
let g:netrw_winsize = 80

" Set cursorline
set cursorline

" Enable project speficific vimrc
set exrc

" Show next matched string at the center of the screen when n or N
nnoremap n nzz
nnoremap N Nzz

" Map keys to cycling through buffers
map <C-K> :bprev<CR>
map <C-J> :bnext<CR>

" Map jeys to switch window
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Make . to work with visually selected lines
vnoremap . :normal.<CR>

" Enable project speficific vimrc
set exrc

" Move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Enable folding
set foldenable
" Open most of the folds by default. If set to 0, all folds will be closed
set foldlevelstart=1
" Folds can be nested. Setting a max value protects you from too many folds
set foldnestmax=10
" Defines the type of folding
set foldmethod=syntax
" sh - enable function folding
let sh_fold_enabled=1
" JavaScript
let javaScript_fold=1

" Set indentLine plugin
" Indent level has a distinct character
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Remap NERDTree to F6
nmap <F6> :NERDTreeToggle<CR>
" Toggle hidden files
let NERDTreeShowHidden=1

" Set ctrlp.vim plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Mapping
" Map leader key
let mapleader = "\<Space>"
" Other mapping
nnoremap <Leader>w :w<CR>
nmap <silent> ,/ :nohlsearch<CR>

" Highlight trailing whitespace
match ErrorMsg '\s\+$'
" Remove trailing whitespaces automatically
autocmd BufWritePre * :%s/\s\+$//e

" Jump back to last edited buffer
nnoremap <C-b> <C-^>
inoremap <C-b> <esc><C-^>

" Open up search instead of a man page on hitting K (script stored at /usr/local/bin/google)
set keywordprg=google
