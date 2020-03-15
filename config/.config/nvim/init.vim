" Neovim config
call plug#begin()
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'vimwiki/vimwiki'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'nvie/vim-flake8'
Plug 'lervag/vimtex'
Plug 'frazrepo/vim-rainbow'
call plug#end()


" LOAD CONFIGURATION FILES ON ~/.config/nvim/config/
for f in glob('~/.config/nvim/config/*.vim',0,1)
	execute 'source' f
endfor
