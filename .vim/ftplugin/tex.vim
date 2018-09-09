" Custom maps.
"nnoremap <buffer> <ESC>c :w <Bar>:!clear; latexmk -file-line-error -halt-on-error -pdf %<ENTER>
"nnoremap <buffer> <ESC>p :silent !zathura %:r.pdf&<ENTER>
nmap <buffer> <A-c> <plug>(vimtex-compile)
nmap <buffer> <A-p> <plug>(vimtex-view)
nmap <buffer> <A-e> <plug>(vimtex-errors)
imap <c-l> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <c-l> [s1z=<c-o> 

" Spell checking.
setlocal spell
setlocal spelllang=es_es,en_us
setlocal spellfile=~/.vim/spell/words.utf-8.add

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

" Syntastic stuff.
let g:syntastic_quiet_messages = { "regex": [
        \ '\mpossible unwanted space at "{"',
        \ ] }

" Enable youcompleteme.
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" Textwidth.
setlocal textwidth=99
setlocal colorcolumn=+0                                                                                  
highlight ColorColumn ctermbg=015

" Format options.
au FileType tex set fo+=t

" Folding.
setlocal nofoldenable

