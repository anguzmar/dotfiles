" Custom maps
nnoremap <buffer> <silent> <A-p> :w !python %<ENTER>
nnoremap <buffer> <A-b> oimport pdb; pdb.set_trace()<ESC>
nnoremap <buffer> <silent> <Leader>ru :vs <Bar> :terminal python %<ENTER>
nnoremap <buffer> <Leader>f :!flake8 %<ENTER>
nnoremap <buffer> <silent> <leader>b :Black<ENTER>
nnoremap <buffer> <silent> <leader>i :!isort %<ENTER>
nnoremap <buffer> <silent> <leader>m :!mypy %<ENTER>
nnoremap <buffer><silent> <leader>re :vs <BAR> :terminal ipython<ENTER> <BAR> :norm! A<ENTER>

" Folding settings
setlocal foldmethod=indent
setlocal foldlevel=99
nnoremap <buffer> <SPACE> za

" Enchanged syntax hilight
let g:python_highlight_space_errors = 0
let g:python_highlight_indent_errors = 0
let g:python_highlight_all = 1

" Indents and stuff
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal autoindent
setlocal expandtab
setlocal textwidth=100
setlocal colorcolumn=+1
highlight ColorColumn ctermbg=2

" Format options
au FileType python set fo+=c  " c = autowrap comments
au FileType python set fo-=t  " t = autowrap text using textwidth
