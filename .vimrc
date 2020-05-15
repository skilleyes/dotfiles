"---- Vundle config ----
"-----------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'ycm-core/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
Plugin 'jeaye/color_coded'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"---- End of Vundle config ----
"------------------------------

" instant-markdown configuration :
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1

" cpp enhanced highlight
"let g:cpp_class_scope_highlight = 1
"let g:cpp_member_variable_highlight = 1

" YouCompleteMe configuration
let g:ycm_goto_buffer_command = 'split-or-existing-window'
let g:ycm_autoclose_preview_window_after_insertion = 1

nnoremap <leader>jd :belowright vertical YcmCompleter GoTo<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
noremap <C-LeftMouse> <LeftMouse> :YcmCompleter GoTo <CR>
noremap <C-RightMouse> <LeftMouse> :YcmCompleter GoTo <CR>*:e %<.cpp<CR>n

scriptencoding utf-8
set encoding=utf-8

" Brightside settings for backups and swaps!
set nobackup nowritebackup noswapfile

" Backspace compatibility
set backspace=2

" Start next line with current indentation
set smartindent
set autoindent

" Color scheme
colorscheme zellner

" Color 100th line
set colorcolumn=100
highlight ColorColumn ctermbg=7

" Highlight column and line
"set cursorcolumn
"set cursorline

:autocmd InsertEnter * set cursorline
:autocmd InsertLeave * set nocursorline

nmap cr :set cursorcolumn <CR> :set cursorline <CR>
nmap rc :set nocursorcolumn <CR> :set nocursorline <CR>
nmap CR :set cursorcolumn <CR> :set cursorline <CR>
nmap RC :set nocursorcolumn <CR> :set nocursorline <CR>

" Syntax highlighting on
syntax on

" Tab width and spaces settings
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Tab completion settings
set wildmode=longest,list,full
set wildmenu
set wildignore=*build*,*.o

set list
set listchars=tab:\|-,trail:·

" Display line numbers
set nu

" Don't enter insert mode when adding line
nnoremap o o<Esc>
nnoremap O O<Esc>

" Ignore case when searching by default
set ignorecase smartcase incsearch hlsearch
set path=$PWD/**

" C header guard macro
let @i="diWi#ifndef \<Esc>pa\<CR>#define \<Esc>pGooi#endif  // \<Esc>p"

" GitGutter config
let g:gitgutter_map_keys = 0
 highlight GitGutterDelete ctermbg=1
 highlight GitGutterAdd ctermbg=2
 highlight GitGutterChange ctermbg=3
 highlight GitGutterChangeDelete ctermbg=3
set updatetime=100

nmap « <Left>
nmap » <Right>
nmap ) <Down>
nmap ( <Up>
vmap « <Left>
vmap » <Right>
vmap ) <Down>
vmap ( <Up>

" Octave syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END

" Enable click to set cursor position
set mouse=a

":map [[ ?{<CR>w99[{
":map ][ /}<CR>b99]}
":map ]] j0[[%/{<CR>
":map [] k$][%?}<CR>

" Always display statusline (:help laststatus)
set laststatus=2
