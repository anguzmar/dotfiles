call plug#begin('~/.vim/plugged')
Plug 'ervandew/supertab'
Plug 'lervag/vimtex'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nvie/vim-flake8'

if has('nvim')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
endif

call plug#end()

" Custom maps.
let mapleader = ","
nnoremap <Leader>q :bp<ENTER>
nnoremap <Leader>w :bn<ENTER>
nnoremap <Leader>p "0p
nnoremap <C-n> :NERDTreeToggle<ENTER>

" Hex editing.
nnoremap <Leader>h :%!xxd<ENTER>
nnoremap <Leader>H :%!xxd -r<ENTER>

" Remove trailing white spaces.
nnoremap <Leader>tr :%s/\s\+$//e <BAR> :w<ENTER>

if has('nvim')
tnoremap <Esc> <C-\><C-n>
nnoremap <Leader>te :terminal<ENTER>
endif

" Useful stuff.
syntax enable
"set showmode
"set showcmd
set number
set relativenumber
set encoding=UTF-8
set backupdir=~/.TMP
set background=dark
setlocal shiftwidth=4
setlocal tabstop=4

" Color scheme.
color evening
hi Normal ctermbg=None
hi Folded ctermbg=60 ctermfg=2

" Deoplete settings.
let g:deoplete#enable_at_startup = 1

" Vim airline settings.
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
set ttimeoutlen=20

" Nerdtree settings.
let NERDTreeNaturalSort=1
let NERDTreeMinimalUI=1

" Devicons settings.
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" Split settings.
set splitbelow
set splitright

" Split navigations.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Change directory to match the file's.
autocmd BufEnter * silent! lcd %:p:h

" Make sure it understands what .tex means.
let g:tex_flavor='latex'

" Disable file specific plugins.
let g:vimtex_enable='0'

" Fuck square bracket. Some custom keyboard mappings.
set langmap='[,¡],+=,º`

" Format options.
set textwidth=120
au FileType * set fo-=o fo+=j

" Performance.
set ttyfast
"syntax off

