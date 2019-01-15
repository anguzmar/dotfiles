setlocal shiftwidth=4
setlocal tabstop=4
let asmsyntax = "nasm"

augroup filetype
	autocmd!
	autocmd BufEnter *.asm setlocal filetype=nasm
augroup END

" Compile stuff automatically.
nnoremap <Leader>c :!nasm -g -f elf32 % -o %:r.o && ld -m elf_i386 %:r.o -o %:r<ENTER>
nnoremap <Leader>e :!./%:r<ENTER>

