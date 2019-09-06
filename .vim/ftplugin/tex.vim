" Custom maps.
"nnoremap <buffer> <ESC>c :w <Bar>:!clear; latexmk -file-line-error -halt-on-error -pdf %<ENTER>
"nnoremap <buffer> <ESC>p :silent !zathura %:r.pdf&<ENTER>
nmap <buffer> <A-c> <plug>(vimtex-compile)
nmap <buffer> <A-p> <plug>(vimtex-view)
nmap <buffer> <A-e> <plug>(vimtex-errors)
imap <c-l> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <c-l> [s1z=<c-o>

" By default, english spell checking
setlocal spell spelllang=en_us
setlocal spellfile=$HOME/.vim/spell/words_en.utf-8.add

" Change spelllang
nnoremap <buffer> <silent> <Leader>es :setlocal spelllang=es <BAR> :setlocal spellfile=$HOME/.vim/spell/words_es.utf-8.add<ENTER>
nnoremap <buffer> <silent> <Leader>en :setlocal spelllang=en_us <BAR> :setlocal spellfile=$HOME/.vim/spell/words_en.utf-8.add<ENTER>

" Spell checking colors.
hi SpellBad	ctermfg=015      ctermbg=001     cterm=none
hi SpellRare	ctermfg=015      ctermbg=010     cterm=none
hi SpellCap	ctermfg=015      ctermbg=013     cterm=none

" Server stuff.
if empty(v:servername) && exists('*remote_startserver')
       call remote_startserver('VIM')
endif

" Vimtex options.
let g:vimtex_enabled='1'
let g:vimtex_view_method='zathura'
set foldmethod=expr
set foldexpr=vimtex#fold#level(v:lnum)

" Enable deoplete.
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

" Syntastic stuff.
let g:syntastic_quiet_messages = { "regex": [
        \ '\mpossible unwanted space at "{"',
        \ ] }

" Textwidth.
setlocal textwidth=99

" Folding.
setlocal nofoldenable

