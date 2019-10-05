call plug#begin('~/.vim/plugged')
Plug 'ervandew/supertab'  													" Used for tab completion
Plug 'lervag/vimtex', { 'for': 'tex' }  									" LaTeX + VIM
Plug 'vim-airline/vim-airline'  											" A better statusline
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }  					" Visualize directory within VIM
Plug 'ryanoasis/vim-devicons', { 'on':  'NERDTreeToggle' }  				" Add icons for nerdtree according to the filetype
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on':  'NERDTreeToggle' }
Plug 'tmhedberg/SimpylFold', { 'for': 'python' } 							" Better folding for Python
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }  					" Better automatic indentation for Python multiple line command
Plug 'jiangmiao/auto-pairs'  												" Automatically generate matching pair for brackets and quotes
Plug 'tpope/vim-commentary'  												" Easy comment toggling
Plug 'psf/black', { 'for': 'python' }  										" A godsend. Autoformatter for Python
Plug 'tpope/vim-surround'  													" Add, remove or change pairs of brackets/quotes easily
Plug 'tpope/vim-ragtag'  													" Rad plugin for HTML tags
Plug 'vim-python/python-syntax', { 'for': 'python' }  						" Enhanced Python syntax (yield, f-strings, etc.)
Plug 'tpope/vim-fugitive'  													" Git wrapper
Plug 'tpope/vim-repeat'  													" Repeat 'some' Plugin commands with '.'
Plug 'junegunn/fzf.vim' 													" FZF for vim
Plug 'pangloss/vim-javascript', { 'for': 'javascript' } 					" Improved syntax and indentation for Javascript

if has('nvim')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }  				" Autocompletion engine
Plug 'zchee/deoplete-jedi', { 'for': 'python' }  							" Autocompletion source for Python
Plug 'wokalski/autocomplete-flow', {'for': 'javascript'} 					" Autocompletion source for Javascript
endif
call plug#end()


" Map leader key
let mapleader = ","


" ***************************************************************************** "
" 							PLUGIN SETTINGS 									"

" Flow
let g:autocomplete_flow#insert_paren_after_function = 0

" Black
let g:black_linelength = 100

" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('max_list', 20)
call deoplete#custom#source('_', 'matchers', ['matcher_head'])

" Autopair
let g:AutoPairsShortcutToggle = '<M-a>'

" Supertab
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" Vim airline
let g:airline_theme='deus'
let g:airline_exclude_preview = 1
let g:airline_section_c = "%{expand('%:p:h:t')}/%t"  " Get parent directory and filename.
set ttimeoutlen=20

" Nerdtree
let NERDTreeNaturalSort=1
let NERDTreeMinimalUI=1
noremap <silent> <C-n> :NERDTreeToggle<ENTER>

" Devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 0

" netrw
let g:netrw_banner = 0

" Toggle comments
map <C-c> <Plug>CommentaryLine

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2

" FZF
let g:fzf_layout = { 'down': '~30%' }
nnoremap <silent> <Leader>sf :Files<ENTER>
nnoremap <silent> <Leader>sl :Lines<ENTER>
nnoremap <silent> <Leader>sbl :BLines<ENTER>


" 							PLUGIN SETTINGS END 								"
" ***************************************************************************** "


" Clear search highlighting
nnoremap <silent> <esc> :noh<return><esc>

" Buffer navigation and stuff
noremap <silent> <C-left> :bprev<ENTER>
noremap <silent> <C-right> :bnext<ENTER>
noremap <silent> <Leader>w :bdelete %<ENTER>
set hidden  " Set buffers to hidden. Allows to change buffers without having to save them

" Paste the latest yank
nnoremap <Leader>p "0p

" Copy the entire file to the clipboard
nnoremap <silent> <Leader>c :%y+<ENTER>

" Paste from clipboard
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

" Make sure Vim understands what .tex means
let g:tex_flavor='latex'

" Some custom keyboard mappings
set langmap=ñ`

" Format options.
set textwidth=100
au FileType * set fo-=o fo-=r  " o and r = auto insert comment leader on normal mode and insert mode respectively

" Enforce syntax/filetype for certain extensions
au BufNewFile,BufRead *.muttrc setlocal syntax=neomuttrc
au BufNewFile,BufRead *.mail setlocal filetype=mail
au BufNewFile,BufRead *.gdb setlocal filetype=gdb

" Python paths
let g:python3_host_prog = '/usr/bin/python'
let g:python2_host_prog = '/usr/bin/python2'

" Color scheme.
color delek
hi Normal ctermbg=None
hi Folded ctermbg=60 ctermfg=2
hi LineNr ctermfg=255
hi CursorLineNr ctermfg=255
hi Visual cterm=bold ctermbg=White ctermfg=Black
hi Pmenu ctermbg=White ctermfg=Black
hi PmenuSel ctermbg=Magenta ctermfg=White
