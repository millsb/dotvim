" Formatting (some of these are for coding in C and C++)
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
" set cindent
set autoindent
set smarttab
set expandtab
set number " Show line numbers

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set list
" Show $ at end of line and trailing space as ~
set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
colorscheme molokai
set guifont=Monaco:h12
set guioptions-=T " Get rid of gui toolbar
set showtabline=2
