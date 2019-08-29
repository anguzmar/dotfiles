" Activate plugins

" Custom maps
nnoremap <buffer> <silent> <A-p> :w !python %<ENTER>
nnoremap <buffer> <A-b> oimport pdb; pdb.set_trace()<ESC>
nnoremap <buffer> <silent> <Leader>r :vs <Bar> :terminal python %<ENTER>
nnoremap <buffer> <Leader>f :!flake8 %<ENTER>
nnoremap <buffer> <silent> <leader>b :Black<ENTER>

" Folding settings
setlocal foldmethod=indent
setlocal foldlevel=99
nnoremap <buffer> <SPACE> za

" Enchanged syntax hilight
let g:python_highlight_space_errors = 0
let g:python_highlight_indent_errors = 0
let g:python_highlight_all = 1

" Flake8 settings
" autocmd BufWritePost *.py call flake8#Flake8()  " Run flake8 when saving

" Indents and stuff
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal autoindent
setlocal expandtab
setlocal textwidth=100
setlocal colorcolumn=+1
highlight ColorColumn ctermbg=2

" Python paths
let g:python3_host_prog = '/usr/bin/python'
let g:python2_host_prog = '/usr/bin/python2'

" Format options
au FileType python set fo+=c  " c = autowrap comments
au FileType python set fo-=t  " t = autowrap text using textwidth
