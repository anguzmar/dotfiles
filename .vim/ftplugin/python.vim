" Activate plugins.

" Custom maps.
nnoremap <A-r> :w !python<ENTER>
nnoremap <A-b> oimport pdb; pdb.set_trace()<ESC>
nnoremap <Leader>r :vs <Bar> :terminal python %<ENTER>
noremap <A-c> I#<ESC>

" Folding settings.
setlocal foldmethod=indent
setlocal foldlevel=99
nnoremap <SPACE> za

" Indents and stuff.
setlocal ts=4
setlocal autoindent
setlocal expandtab
setlocal shiftwidth=4
setlocal textwidth=99
setlocal colorcolumn=+0
highlight ColorColumn ctermbg=2

" Format options.
au FileType python set fo+=t

