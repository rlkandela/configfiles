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


set softtabstop=2 " Indent by 2 spaces when hitting tab
set shiftwidth=4 " Indent by 4 spaces when auto-indenting
set tabstop=4 " Show existing tab with 4 spaces width
filetype on
filetype plugin on
filetype indent on " Enable indenting for files
set autoindent " Enable auto indenting
set nobackup " Disable backup files
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set statusline^=%{StatusDiagnostic()}
set wildmenu " Display command line's tab complete options as a menu.
set laststatus=2 "show status line

map <Space> <Leader>
" Insert new line in normal mode on the top
nmap <C-o> O<ESC>
" Insert new line in normal mode on the bottom
nmap <Enter> o<ESC>

"let mapleader = ','
set runtimepath+=,~/.config/nvim/autoload,~/.config/nvim/coc.nvim


autocmd FileType json syntax match Comment +\/\/.\+$+

function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, 'E' . info['error'])
	endif
    if get(info, 'warning', 0)
		call add(msgs, 'W' . info['warning'])
    endif
	return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction



"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
"endif

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

" Vimwiki
set nocompatible
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
let g:vimwiki_table_mappings = 0

let g:lightline = {
      \ 'colorscheme': 'onedark',
	  \ 'active': {
      \     'left':[ [ 'mode', 'paste' ],
	  \              [ 'gitbranch', 'readonly', 'filename', 'modified', 'cocstatus' ]
	  \     ]
	  \   },
	  \  'component_function': {
	  \   'cocstatus': 'coc#status',
	  \   'currentfunction': 'CocCurrentFunction'
	  \ },
      \ }

"let g:LanguageClient_serverCommands = {
"    \ 'sh': ['bash-language-server', 'start']
"    \ }



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




" LaTex
let g:tex_flavor = "latex"


call plug#begin()
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'vimwiki/vimwiki'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdcommenter'
Plug 'lervag/vimtex'
Plug 'frazrepo/vim-rainbow'
call plug#end()
colorscheme onedark " Set nice looking colorscheme
"let g:vimtex_view_method = 'zathura'
let g:polyglot_disabled = ['latex']
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
"set conceallevel=1
"let g:tex_conceal='abdmg'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_latexlog = {
			\ 'overfull' : 0,
			\ 'underfull' : 0,
			\ 'packages' : {
			\   'default' : 0,
			\ },
			\}
set updatetime=500
autocmd FileType tex autocmd CursorHold,CursorHoldI * update

"let g:vimtex_compiler_latexmk = { 
        "\ 'executable' : 'latexmk',
        "\ 'options' : [ 
        "\   '-xelatex',
        "\   '-file-line-error',
        "\   '-synctex=1',
        "\   '-interaction=nonstopmode',
        "\ ],
        "\}

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

nnoremap <Left> :echo "Eres imbecil"<CR>
vnoremap <Left> :<C-u>echo "Eres imbecil"<CR>
inoremap <Left> <C-o>:echo "Eres imbecil"<CR>
nnoremap <Right> :echo "Eres imbecil"<CR>
vnoremap <Right> :<C-u>echo "Eres imbecil"<CR>
inoremap <Right> <C-o>:echo "Eres imbecil"<CR>
nnoremap <Up> :echo "Eres imbecil"<CR>
vnoremap <Up> :<C-u>echo "Eres imbecil"<CR>
inoremap <Up> <C-o>:echo "Eres imbecil"<CR>
nnoremap <Down> :echo "Eres imbecil"<CR>
vnoremap <Down> :<C-u>echo "Eres imbecil"<CR>
inoremap <Down> <C-o>:echo "Eres imbecil"<CR>
nnoremap <PageUp> :echo "Eres imbecil"<CR>
vnoremap <PageUp> :<C-u>echo "Eres imbecil"<CR>
inoremap <PageUp> <C-o>:echo "Eres imbecil"<CR>
nnoremap <PageDown> :echo "Eres imbecil"<CR>
vnoremap <PageDown> :<C-u>echo "Eres imbecil"<CR>
inoremap <PageDown> <C-o>:echo "Eres imbecil"<CR>
