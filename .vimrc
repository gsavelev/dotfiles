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
" Real programmers don't use TAB but spaces
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
vmap <Leader>y                 "+y
vmap <Leader>d                 "+d
nmap <Leader>p                 "+p
nmap <Leader>p                 "+P
vmap <Leader>p                 "+p
vmap <Leader>P                 "+P
nmap <Leader>/ :nohlsearch<CR> " Turn off highlighting until the next search


vnoremap . :normal.<CR>         " Make . to work with visually selected lines
vnoremap J :m '>+1<CR>gv=gv     " Move visual selection
vnoremap K :m '<-2<CR>gv=gv


" move vertically by visual line with j and k
nnoremap j gj
nnoremap k gk


" =============================================================================
" Plugins
" =============================================================================


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
filetype off
execute pathogen#infect()
call pathogen#helptags()


filetype plugin indent on


" Airline
" git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
let g:airline_theme = 'dark'                 " Ex. simple theme
let g:airline#extensions#tabline#enabled = 1 " Smarter tab line
let g:airline_powerline_fonts = 1            " Enable Powerline fonts
let g:airline#extensions#branch#enabled = 1  " Show git branch


" =============================================================================
" Python IDE Setup
" =============================================================================


" NERDTree
" git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
nmap <Leader>N :NERDTreeToggle<CR>    " remap to Leader+N
autocmd StdinReadPre * let s:std_in=1 " open NERDTree automatically when vim
                                      " starts up on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let NERDTreeShowHidden=1              " toggle hidden files
let g:NERDTreeWinSize=22


" IndentLine
" git clone https://github.com/Yggdroot/indentLine.git ~/.vim/bundle/
let g:indentLine_char_list = ['|', '¦', '┆', '┊'] " indent level has a
                                                  " distinct character

" Ctrlp.vim plugin
" git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/
set runtimepath^=~/.vim/bundle/ctrlp.vim


" Pymode
" git clone --recurse-submodules https://github.com/python-mode/python-mode.git ~/.vim/bundle/
" Disable autocomplete (use jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

let g:pymode_virtualenv = 1   " enable virtualenv

let g:pymode_breakpoint = 1   " enable breakpoints
let g:pymode_breakpoint_key = '<leader>b'

let g:pymode_run = 1 " enable Pymode run code

" ipnb breakpoints
" change 2-nd parameter in
" vim ~/.vim/bundle/python-mode/plugin/pymode.vim +177
" to
" from ipdb import set_trace; set_trace()


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable


" TaskList
" git clone --recurse-submodules https://github.com/python-mode/python-mode.git ~/.vim/bundle/
map <F2> :TaskList<CR> " show task list (TODO, FIXME, XXX lines) on F2


" JSON formatting
com! FormatJSON %!python -m json.tool --no-ensure-ascii
