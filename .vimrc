" Alarms
set noerrorbells                    " disable beep on errors
set visualbell                      " flash the screen instead of beeping
                                    " on errors
" silent message like E45: 'readonly' option is set ...
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
match ErrorMsg '\s\+$'              " highlight trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e  " remove trailing whitespaces automatically


" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile
set undofile                 " maintain undo history between sessions
set undodir=~/.vim/undodir   " set undo directory


" Showing line numbers and length
set number                                          " show line numbers
set colorcolumn=80                                  " show 80s symbol in row
set relativenumber                                  " set relative numbers
augroup toggle_relative_number
autocmd InsertEnter * :setlocal norelativenumber    " absolute numbers only
                                                    " in Insert mode
autocmd InsertLeave * :setlocal relativenumber      " enable relative numbers
                                                    " only in Normal mode

" Cursor
set cursorline   " set cursorline
set ruler        " always show cursor position


" Status line
set laststatus=2         " show status line
set statusline=%t        " tail of the filename
set statusline+=\ %{&ff} " file format
set statusline+=%h       " help file flag
set statusline+=%m       " modified flag
set statusline+=%r       " read only flag
set statusline+=%y       " file type
set statusline+=\ %c,    " cursor column
set statusline+=%l/%L    " cursor line/total lines
set statusline+=\ %P     " percent through file


" Search
set hlsearch            " highlight patterns in search
set incsearch           " find the next match as we type the search
set ignorecase          " ignore case when searching
set smartcase           " unless you type a capital

set keywordprg=google   " Open up search instead of a man page on hitting K
                        " (script stored at /usr/local/bin/google)
nnoremap n nzz          " show next matched string at the center of the screen
nnoremap N Nzz          " when n or N


" Indentation
set autoindent      " new lines inherit the indentation of previous lines
set tabstop=4       " number of tabulation indents
set shiftwidth=4    " indent size
set smarttab        " tab-indent size
set expandtab       " on pressing tab, insert 4 spaces
set nowrap          " don’t wrap lines


" Text rendering
set encoding=utf-8      " use an encoding that supports Unicode
set linebreak           " wrap lines at convenient points
set scrolloff=5         " the number of screen lines to keep above
                        " and below the cursor
set sidescrolloff=5     " the number of screen columns to keep to the left
                        " and right of the cursor
syntax on               " syntax highlighting


let g:netrw_browse_split = 4 " Open files in split window
let g:netrw_winsize = 80     " Set new split window size at 80%


" Folding
set foldenable          " enable folding
set foldlevelstart=1    " open most of the folds by default.
                        " If set to 0, all folds will be closed
set foldnestmax=10      " folds can be nested.
                        " Setting a max value protects you from too many folds
set foldmethod=syntax   " defines the type of folding
let sh_fold_enabled=1   " sh - enable function folding
let javaScript_fold=1   " JavaScript


" =============================================================================
" Mapping
" =============================================================================


let mapleader = "\<Space>" " map leader key


" switch between tabs
map  <Leader>l :tabn<CR>
map  <Leader>h :tabp<CR>
map  <C-n> :tabnew<CR>


" easier moving of codes blocks
vnoremap < <gv
vnoremap > >gv


" map keys to cycling through buffers
map <C-K> :bprev<CR>
map <C-J> :bnext<CR>


" map jeys to switch window
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>


" jump back to last edited buffer
nnoremap <C-b> <C-^>
inoremap <C-b> <esc><C-^>


" other mapping
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>q :q<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>p "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <silent> ,/ :nohlsearch<CR>


vnoremap . :normal.<CR>         " Make . to work with visually selected lines
vnoremap J :m '>+1<CR>gv=gv     " Move visual selection
vnoremap K :m '<-2<CR>gv=gv


" =============================================================================
" Plugins
" =============================================================================


" NERDTree
nmap <Leader>n :NERDTreeToggle<CR>    " remap to Leader+n
autocmd StdinReadPre * let s:std_in=1 " open NERDTree automatically when vim
                                      " starts up on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let NERDTreeShowHidden=1              " toggle hidden files


" Pathogen
filetype off

execute pathogen#infect()
call pathogen#helptags()

filetype plugin indent on


" Emmet
let g:user_emmet_leader_key=',' " redefine trigger key


" IndentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊'] " indent level has a
                                                  " distinct character

" Ctrlp.vim plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim
