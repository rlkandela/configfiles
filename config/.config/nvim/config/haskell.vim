" Haskell file

" Show documentation on K press
nnoremap <silent>K :call <SID>show_documentation()<CR>
" Show documentation function
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" 
nnoremap <Leader>F :call CocAction('format')<CR>

" Jumps to gg on write
" let g:syntastic_auto_jump=0
