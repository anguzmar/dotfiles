" By default, english spell checking
setlocal spell spelllang=en_us
setlocal spellfile=$HOME/.vim/spell/words-english.utf-8.add

" Change spelllang
nnoremap <buffer> <silent> <Leader>es :setlocal spelllang=es <BAR> :setlocal spellfile=$HOME/.vim/spell/words-spanish.utf-8.add<ENTER>
nnoremap <buffer> <silent> <Leader>en :setlocal spelllang=en_us <BAR> :setlocal spellfile=$HOME/.vim/spell/words-english.utf-8.add<ENTER>

" Useful binds
imap <c-l> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <c-l> [s1z=<c-o>

" Textwidth
setlocal textwidth=100
