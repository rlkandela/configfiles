"set nocompatible " Use Vim settings, rather than Vi settings
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_winsize = 20
set number " Enable line numbers
set relativenumber
set cursorline
set spelllang=es,en
set backspace=indent,eol,start
set history=1000
set showcmd
set noshowmode
set autoread
set hidden
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

set undofile
set undodir=~/.vim/undodir

" terminal
:tnoremap <Esc> <C-\><C-n>

set softtabstop=2 " Indent by 2 spaces when hitting tab
set shiftwidth=2 " Indent by 2 spaces when auto-indenting
set tabstop=2 " Show existing tab with 2 spaces width
set expandtab
filetype on
filetype plugin on
filetype indent on " Enable indenting for files
set autoindent " Enable auto indenting
set nobackup " Disable backup files
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set statusline^=%{StatusDiagnostic()}
set statusline^=%{FugitiveStatusline()}
set wildmenu " Display command line's tab complete options as a menu.
set laststatus=2 "show status line

map <Space> <Leader>
" So _ is treated as space
set iskeyword-=_
" Insert new line in normal mode on the top
"nmap <C-o> O<ESC>
" Insert new line in normal mode on the bottom
"nmap <Enter> o<ESC>

"let mapleader = ','
set runtimepath+=,~/.config/nvim/autoload,~/.config/nvim/coc.nvim


autocmd FileType json syntax match Comment +\/\/.\+$+

set ruler
set tabpagemax=40
syntax on " Enable syntax highlighting
"colorscheme onedark " Set nice looking colorscheme
set noerrorbells
set visualbell
set directory=$HOME/.vim/swp//


if !has('gui_running')
  set t_Co=256
endif

