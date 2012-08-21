"-- Pathogen 
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
set nocompatible
set t_Co=256


"-- Sane timeout values
set notimeout
set ttimeout
set ttimeoutlen=10


"-- Tabs are 2 spaces, btw
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
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
syntax on
set background=dark
colorscheme solarized
set showmatch
set backspace=2
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set cursorline
set ttyfast
set ruler
set laststatus=2


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
