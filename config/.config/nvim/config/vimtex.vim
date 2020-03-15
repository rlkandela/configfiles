let g:polyglot_disabled = ['latex']
let g:tex_flavour = 'latex'
let g:vimtex_view_method = 'zathura'
set conceallevel=1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_latexlog = {
			\ 'overfull' : 0,
			\ 'underfull' : 0,
			\ 'packages' : {
			\		'default' : 0,
			\ },
			\}

set updatetime=5000
autocmd Filetype tex autocmd CursorHold,CursorHoldI * update
