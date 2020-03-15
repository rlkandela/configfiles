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

