" Activate plugins

" Custom maps
nnoremap <A-p> :w !python<ENTER>
nnoremap <A-b> oimport pdb; pdb.set_trace()<ESC>
nnoremap <Leader>r :vs <Bar> :terminal python %<ENTER>

" Folding settings
setlocal foldmethod=indent
setlocal foldlevel=99
nnoremap <SPACE> za

" Flake8 settings
autocmd BufWritePost *.py call flake8#Flake8()  " Run flake8 when saving

" Indents and stuff
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal autoindent
setlocal expandtab
setlocal textwidth=120
setlocal colorcolumn=+0
highlight ColorColumn ctermbg=2

" Python paths
let g:python3_host_prog = '/usr/bin/python'
let g:python2_host_prog = '/usr/bin/python2'

" Format options
au FileType python set fo+=c  " c = autowrap comments
