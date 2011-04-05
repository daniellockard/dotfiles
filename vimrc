" Basics {
	set nocompatible
	set background=dark
"	}

" General {
	syntax on
	set mouse=a
  scriptencoding utf-8
	set shortmess+=filmnrxoOtT
	set viewoptions=folds,options,cursor,unix,slash
	set history=1000
	set spell

	" Some backup stuff {
		set backup
		au BufWinLeave * silent! mkview  "make vim save view (state) (folds, cursor, etc)
		au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)


	"}



"}

" VIM UI {

	color koehler 
	set tabpagemax=15
	set showmode

	set cursorline
	hi cursorline guibg=#333333
	hi CursorColumn guibg=#333333

	if has('cmdline_info')
		set ruler
		set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
		set showcmd
	endif

	if has('statusline')
		set laststatus=2
		set statusline=%<%f\
		set statusline+=%w%h%m%r
		set statusline+=\ [%{&ff}/%Y]
		set statusline+=\ [%{getcwd()}]
		set statusline+=%=%-14.(%l,%c%V%)\ %p%%
	endif

	set backspace=indent,eol,start
	set linespace=0
	set nu
	set showmatch
	set incsearch
	set hlsearch
	set winminheight=0
	set ignorecase
	set smartcase
	set wildmenu
	set wildmode=list:longest,full
	set whichwrap=b,s,h,l,<,>,[,]
	set scrolljump=5
	set scrolloff=3
	set foldenable
	set gdefault

"}

" Formatting {
	set nowrap
	set autoindent
	set shiftwidth=4
	set noexpandtab
	set tabstop=4
	set pastetoggle=<F12>
"}

" Remappings {

	cmap W w                       
    cmap WQ wq
    cmap wQ wq
    cmap Q q
    cmap Tabe tabe


    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>
	cmap w!! w !sudo tee % >/dev/null
"}

function! InitializeDirectories()
  let separator = "."
  let parent = $HOME
  let prefix = '.vim'
  let dir_list = {
              \ 'backup': 'backupdir',
              \ 'views': 'viewdir',
              \ 'swap': 'directory' }

  for [dirname, settingname] in items(dir_list)
      let directory = parent . '/' . prefix . dirname . "/"
      if exists("*mkdir")
          if !isdirectory(directory)
              call mkdir(directory)
          endif
      endif
      if !isdirectory(directory)
          echo "Warning: Unable to create backup directory: " . directory
          echo "Try: mkdir -p " . directory
      else  
          let directory = substitute(directory, " ", "\\\\ ", "")
          exec "set " . settingname . "=" . directory
      endif
  endfor
endfunction
call InitializeDirectories() 
