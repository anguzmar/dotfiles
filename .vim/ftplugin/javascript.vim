" Custom maps
nnoremap <buffer> <silent> <A-p> :w !node %<ENTER>
nnoremap <buffer> <silent> <Leader>b :w !prettier --write %<ENTER>

" Indents and stuff
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal autoindent
setlocal expandtab
setlocal textwidth=99
setlocal colorcolumn=+1
highlight ColorColumn ctermbg=2

" Format options
au FileType python set fo+=c  " c = autowrap comments
au FileType python set fo-=t  " t = autowrap text using textwidth
