"-- Pathogen 
filetype off
call pathogen#infect()
filetype plugin indent on
set nocompatible
set t_Co=256
set nofixendofline

"-- Set Gist keymap
map gs :Gist -p<CR>

"-- Powerline beta!
set noshowmode
set encoding=utf-8
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
set fillchars+=stl:\ ,stlnc:\

"-- NERDTree
map <C-n> :NERDTreeToggle<CR>

"-- Sane timeout values
set notimeout
set ttimeout
set ttimeoutlen=10


"-- Tabs are 4 spaces, btw
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set wrap
set textwidth=80
set formatoptions=qrn1

"-- Backups and stuff
set undofile
set undodir=~/tmp/undo//
set backupdir=~/tmp/backup//
set directory=~/tmp/swap//
set backup
set noswapfile
au FocusLost * :wa

"-- Colors and things
syntax enable
set background=dark
colorscheme solarized
set showmatch
set backspace=2
set encoding=utf-8
set scrolloff=3
set showcmd
set cursorline
set ttyfast
set ruler
set laststatus=2
set number


"-- Nav keys, goooo
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

"-- Maps
cmap W w
cmap WQ wq
cmap wQ wq
cmap Q q

"-- Stupid help key, we don't need no stinking help.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>


"-- better search

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

function! EnsureDirExists (dir)
  if !isdirectory(a:dir)
    if exists("*mkdir")
      call mkdir(a:dir,'p')
      echo "Created directory: " . a:dir
    else
      echo "Please create directory: " . a:dir
    endif
  endif
endfunction

call EnsureDirExists($HOME . '/tmp/swap')
call EnsureDirExists($HOME . '/tmp/undo')
call EnsureDirExists($HOME . '/tmp/backup')

au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
