" Open nerdtree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if just nerdtree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open nerdtree shortcuts
inoremap <C-s> <Esc>:NERDTreeToggle<CR>
nnoremap <C-s> :NERDTreeToggle<CR>
vnoremap <C-s> <Esc>:NERDTreeToggle<CR>

" Close when acces a file
let NERDTreeQuitOnOpen=1

" Open file with l
let NERDTreeMapActivateNode='l'
