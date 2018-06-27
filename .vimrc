scriptencoding utf-8
set encoding=utf-8

" Syntax highlighting on
syntax on

" Tab width and spaces settings
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Tab completion settings
set wildmode=longest,list,full
set wildmenu

set list
set listchars=tab:\|-,trail:·

" Display line numbers
set nu

" Highlight search
set hlsearch

map [ <Left>
map € <Right>
map ] <Down>
map ) <Up>

" Double tap i or I to exit Insert mode
imap ii <Esc>
imap II <Esc>
