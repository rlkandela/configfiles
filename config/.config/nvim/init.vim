" Neovim config
call plug#begin()
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
"Plug 'vimwiki/vimwiki'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'flw-cn/vim-nerdtree-l-open-h-close'
Plug 'jiangmiao/auto-pairs'
Plug 'nvie/vim-flake8'
Plug 'lervag/vimtex'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
"Plug 'junegunn/fzf'
Plug 'mbbill/undotree'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'PietroPate/vim-tex-conceal'
call plug#end()


" LOAD CONFIGURATION FILES ON ~/.config/nvim/config/
for f in glob('~/.config/nvim/config/*.vim',0,1)
	execute 'source' f
endfor
