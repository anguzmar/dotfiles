call plug#begin('~/.vim/plugged')
Plug 'ervandew/supertab'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'psf/black', { 'for': 'python' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'terryma/vim-multiple-cursors'

if has('nvim')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
endif
call plug#end()

" Clear search highlighting
nnoremap <silent> <esc> :noh<return><esc>

" Map leader key
let mapleader = ","

" Buffer navigation and stuff
noremap <silent> <C-left> :bprev<ENTER>
noremap <silent> <C-right> :bnext<ENTER>
noremap <silent> <Leader>w :bdelete %<ENTER>
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
set hidden  " Set buffers to hidden. Allows to change buffers without having to save them

" Toggle comments
nmap <C-c> <Plug>CommentaryLine

" Paste the latest yank
nnoremap <C-y> "0p

" Copy/paste to/from clipboard
nnoremap <silent> <Leader>c :%y+<ENTER>
nnoremap <Leader>v "+p

" Hex editing
nnoremap <Leader>h :%!xxd<ENTER>
nnoremap <Leader>H :%!xxd -r<ENTER>

" Remove trailing white spaces
nnoremap <silent> <Leader>tr :%s/\s\+$//e <BAR> :noh<ENTER> <BAR> :w<ENTER>

if has('nvim')
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <Leader>te :terminal<ENTER>
endif

" Useful stuff
syntax enable
set number
set relativenumber
set encoding=UTF-8
set backupdir=$HOME/.config/vim_backup
set background=dark
set shiftwidth=4
set tabstop=4
set scrolloff=1

" Color scheme
color evening
hi Normal ctermbg=None
hi Folded ctermbg=60 ctermfg=2
hi LineNr ctermfg=255
hi CursorLineNr ctermfg=255
hi Visual cterm=bold ctermbg=White ctermfg=Black

" Black settings
let g:black_linelength = 100

" Deoplete settings
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('max_list', 20)
call deoplete#custom#source('_', 'matchers', ['matcher_head'])
hi Pmenu ctermbg=White ctermfg=Black
hi PmenuSel ctermbg=Magenta ctermfg=White

" Autopair settings
let g:AutoPairsShortcutToggle = '<M-a>'

" Supertab settings
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" Vim airline settings
let g:airline_theme='deus'
let g:airline_exclude_preview = 1
let g:airline_section_c = "%{expand('%:p:h:t')}/%t"  " Get parent directory and filename.
set ttimeoutlen=20

" Nerdtree settings
let NERDTreeNaturalSort=1
let NERDTreeMinimalUI=1
nnoremap <silent> <C-n> :NERDTreeToggle<ENTER>

" Multicursor settings
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<A-m>'
let g:multi_cursor_start_key           = 'g<C-m>'
let g:multi_cursor_select_all_key      = 'g<A-m>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" Devicons settings
let g:WebDevIconsUnicodeDecorateFolderNodes = 0

" ctrlP settings
let g:ctrlp_match_current_file = 0
let g:ctrlp_mruf_max = 50

" Split settings
set splitbelow
set splitright

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Resizing
nnoremap _ <C-W><C-_>
nnoremap <silent> <BAR> :vertical-resize CTRL-W_bar<ENTER>
nnoremap = <C-W><C-=>
nnoremap <down> <C-W><C-->
nnoremap <up> <C-W><C-+>
nnoremap <silent> <left> :vertical resize +1<ENTER>
nnoremap <silent> <right> :vertical resize -1<ENTER>

" Close preview window
nnoremap <C-z> <C-W><C-z>

" Change directory to match the file's
autocmd BufEnter * silent! lcd %:p:h

" Make sure it understands what .tex means
let g:tex_flavor='latex'

" Fuck curly brackets in the spanish layout. Some custom keyboard mappings
set langmap=+{,ç},ñ`

" Format options.
set textwidth=100
au FileType * set fo-=o fo-=r  " o and r = auto insert comment leader on normal mode and insert mode respectively
