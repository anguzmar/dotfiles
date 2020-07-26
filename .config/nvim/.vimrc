call plug#begin('~/.vim/plugged')
" Plug 'ervandew/supertab' 												    " Tab completion
Plug 'lervag/vimtex', { 'for': 'tex' }  									" LaTeX + Vim
Plug 'vim-airline/vim-airline'  											" A better statusline
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }  					" Visualize directory within VIM
Plug 'ryanoasis/vim-devicons', { 'on':  'NERDTreeToggle' }  				" Add icons for nerdtree according to the filetype
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on':  'NERDTreeToggle' }
Plug 'tmhedberg/SimpylFold', { 'for': 'python' } 							" Better folding for Python
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }  					" Better automatic indentation for Python multiple line command
Plug 'jiangmiao/auto-pairs'  												" Automatically generate matching pair for brackets and quotes
Plug 'tpope/vim-commentary'  												" Easy comment toggling
Plug 'psf/black', { 'for': 'python', 'branch' : 'stable' }  				" A godsend. Autoformatter for Python
Plug 'tpope/vim-surround'  													" Add, remove or change pairs of brackets/quotes easily
Plug 'tpope/vim-ragtag'  													" Rad plugin for HTML tags
Plug 'vim-python/python-syntax', { 'for': 'python' }  						" Enhanced Python syntax (yield, f-strings, etc.)
Plug 'tpope/vim-fugitive'  													" Git wrapper
Plug 'tpope/vim-repeat'  													" Repeat 'some' Plugin commands with '.'
Plug 'junegunn/fzf.vim' 													" FZF for vim
Plug 'pangloss/vim-javascript', { 'for': 'javascript' } 					" Improved syntax and indentation for Javascript
Plug 'dracula/vim', { 'as': 'dracula' } 									" Color scheme
Plug 'vimwiki/vimwiki' 														" Note-keeping
Plug 'junegunn/vim-easy-align' 												" Pretty alignment
Plug 'machakann/vim-highlightedyank' 										" Highlight yanked selection
Plug 'psliwka/vim-smoothie'                                                 " Smooth scrolling
Plug 'PProvost/vim-ps1'                                                     " Powershell syntax hilighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}                             " YEP COC - Autocompletion with Language Service Provider (LSP)

" Neovim-only plugins
if has('nvim')
endif
call plug#end()


" Map leader key
let mapleader = ","


" ***************************************************************************** "
" 							PLUGIN SETTINGS 									"

" Supertab
" let g:SuperTabClosePreviewOnPopupClose = 1
" let g:SuperTabDefaultCompletionType = 'context'
" let g:SuperTabContextDefaultCompletionType = '<c-n>'

" Flow
let g:autocomplete_flow#insert_paren_after_function = 0

" Black
let g:black_linelength = 100

" Autopair
let g:AutoPairsShortcutToggle = '<M-a>'

" Vim airline
let g:airline_theme='deus'
let g:airline_exclude_preview = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'  " Do not display unless it is NOT UTF-8
let g:airline_inactive_collapse=1

let g:airline_symbols = {}
let g:airline_symbols.branch = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.maxlinenr = ''

let part1 = "%{expand('%:p:h:t')}/%t"                  " Parent directory/current directory
let part2 = " %{airline#parts#readonly()}"             " Read-only flag
call airline#parts#define_accent(part2, 'red')         " Color the read-only flag as red
let keys = [part1,part2]                               " Define the parts to be included in the section
let g:airline_section_c = airline#section#create(keys) " Create the section

set ttimeoutlen=10 " Lower delay when chaging mode
set noshowmode     " Hide the defaul way of showing what mode you are in

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

" FZF
let g:fzf_layout = { 'down': '~30%' }
nnoremap <silent> <Leader>sf :Files<ENTER>
nnoremap <silent> <Leader>sl :Lines<ENTER>
nnoremap <silent> <Leader>sbl :BLines<ENTER>

" Vimwiki
set nocompatible
filetype plugin on

let wiki_1 = {}
let wiki_1.path = '$HOME/pwk/wiki/'
let wiki_1.path_html = '$HOME/pwk/wiki/html/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'

let wiki_2 = {}
let wiki_2.path = '$HOME/wiki/'
let wiki_2.path_html = '$HOME/wiki/html/'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'

let g:vimwiki_list = [wiki_1, wiki_2]

" Easy align
xmap <silent> ga <Plug>(EasyAlign)
nmap <silent> ga <Plug>(EasyAlign)

" Coc
" Separate file: /home/angel/.config/nvim/plug-config/coc.vim
let g:coc_global_extensions = ['coc-json', 'coc-python', 'coc-vimlsp']


" 							PLUGIN SETTINGS END 								"
" ***************************************************************************** "


" Useful settings
syntax enable                          " Syntax highlighting
set number                             " Show line numbers
set relativenumber                     " Show relative line numbers
set encoding=UTF-8                     " Sane encoding
set backupdir=$HOME/.config/vim_backup " Move the backup directory out of the $HOME folder
set splitbelow                         " Split below by default
set splitright                         " Split to the right by default
set langmap=ñ`                         " Useful keyboard layout changes
set inccommand=split                   " Interactive search and replace
set listchars=tab:▸\ ,eol:¬            " Prettier hidden chars
set hidden                             " Allows to change buffers without having to save them
set mouse=a                            " Allows resizing of windows with the mouse and some other cool stuff

" Global tab settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" Neovim-only settings
if has('nvim')
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <Leader>te :terminal<ENTER>
endif

" Clear search highlighting
nnoremap <silent> <esc> :noh<return><esc>

" Buffer navigation and stuff
noremap <silent> <C-left> :bprev<ENTER>
noremap <silent> <C-right> :bnext<ENTER>
noremap <silent> <Leader>bd :bdelete %<ENTER>

" Paste the latest yank
nnoremap <Leader>p "0p

" Copy the entire file to the clipboard
nnoremap <silent> <Leader>c :%y+<ENTER>

" Hex editing
nnoremap <Leader>h :%!xxd<ENTER>
nnoremap <Leader>H :%!xxd -r<ENTER>

" Remove trailing white spaces
nnoremap <silent> <Leader>tr :%s/\s\+$//e <BAR> :noh<ENTER> <BAR> :w<ENTER>

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

" Format options.
au FileType * set fo-=o fo-=r  " o and r = auto insert comment leader on normal mode and insert mode respectively

" Enforce syntax/filetype for certain extensions
au BufNewFile,BufRead *.muttrc setlocal syntax=neomuttrc
au BufNewFile,BufRead *.mail setlocal filetype=mail
au BufNewFile,BufRead *.gdb setlocal filetype=gdb

" Make sure Vim understands what .tex means
let g:tex_flavor='latex'

" Python paths
let g:python3_host_prog = '/usr/bin/python'
let g:python2_host_prog = '/usr/bin/python2'

" Color scheme.
set background=dark
color dracula
hi Normal ctermbg=None
hi Folded ctermbg=60 ctermfg=2
hi LineNr ctermfg=255
hi CursorLineNr ctermfg=255
hi Visual cterm=bold ctermbg=White ctermfg=Black
hi Pmenu ctermbg=White ctermfg=Black
hi PmenuSel ctermbg=Magenta ctermfg=White
