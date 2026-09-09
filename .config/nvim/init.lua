-- ============================================================================
-- 1. PACKAGES (vim.pack)
-- ============================================================================
vim.pack.add({
  'https://github.com/lervag/vimtex',
  'https://github.com/scrooloose/nerdtree',
  'https://github.com/jiangmiao/auto-pairs',
  'https://github.com/tpope/vim-commentary',
  'https://github.com/tpope/vim-surround',
  'https://github.com/tpope/vim-ragtag',
  'https://github.com/tpope/vim-fugitive',
  'https://github.com/tpope/vim-repeat',
  'https://github.com/junegunn/fzf.vim',
  'https://github.com/dracula/vim',
  'https://github.com/vimwiki/vimwiki',
  'https://github.com/junegunn/vim-easy-align',
  'https://github.com/psliwka/vim-smoothie',
  'https://github.com/PProvost/vim-ps1',
  'https://github.com/fisadev/vim-isort',
  'https://github.com/psf/black',
  'https://github.com/nvim-lualine/lualine.nvim',

  -- Native LSP & Mason Stack
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/williamboman/mason-lspconfig.nvim',
  'https://github.com/neovim/nvim-lspconfig',
})

-- Command: :PackUpdate (Updates all plugins managed by vim.pack)
vim.api.nvim_create_user_command('PackUpdate', function()
  vim.pack.update()
end, { desc = 'Update all plugins via vim.pack' })

-- To delete unused packets. Use :PackUpdate, search for (not active) tag and press "gra" to delete it.

require('lualine').setup({ options = { theme = 'dracula' } })

-- ============================================================================
-- 2. GLOBAL VARIABLES & LEADER KEY
-- ============================================================================
vim.g.mapleader = ','

-- NERDTree & netrw
vim.g.NERDTreeNaturalSort = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.netrw_banner = 0

-- FZF Layout & Options
vim.g.fzf_layout = { window = { width = 0.8, height = 0.8 } }
vim.env.FZF_DEFAULT_OPTS = '--reverse'

-- Vimwiki
vim.g.vimwiki_list = {
  { path = '$HOME/offsec/pwk/wiki/', path_html = '$HOME/offsec/pwk/wiki/html/', syntax = 'markdown', ext = '.md' },
  { path = '$HOME/wiki/', path_html = '$HOME/wiki/html/', syntax = 'markdown', ext = '.md' },
  { path = '$HOME/offsec/awae/wiki/', path_html = '$HOME/offsec/awae/wiki/html/', syntax = 'markdown', ext = '.md' },
}

-- Miscellaneous Globals
vim.g.tex_flavor = 'latex'
vim.g.python3_host_prog = '/usr/bin/python'
vim.g.black_linelength = 100
vim.g.AutoPairsShortcutToggle = '<M-a>'

-- ============================================================================
-- 3. NEOVIM OPTIONS
-- ============================================================================
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.backupdir = vim.fn.expand('$HOME/.config/vim_backup')
opt.splitbelow = true
opt.splitright = true
opt.langmap = 'ñ`'
opt.inccommand = 'split'
opt.listchars = { tab = '▸ ', eol = '¬' }
opt.mouse = 'a'
opt.ttimeoutlen = 10
opt.showmode = false

-- Indentation
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true

-- Appearance
opt.background = 'dark'
vim.cmd.colorscheme('dracula')

-- Highlights
local hl = vim.api.nvim_set_hl
hl(0, 'Normal', { bg = 'NONE', ctermbg = 'NONE' })
hl(0, 'Folded', { ctermbg = 60, ctermfg = 2 })
hl(0, 'LineNr', { ctermfg = 255 })
hl(0, 'CursorLineNr', { ctermfg = 255 })
hl(0, 'Visual', { bold = true, ctermbg = 'White', ctermfg = 'Black' })
hl(0, 'Pmenu', { ctermbg = 'White', ctermfg = 'Black' })
hl(0, 'PmenuSel', { ctermbg = 'Magenta', ctermfg = 'White' })

-- ============================================================================
-- 4. KEYMAPS
-- ============================================================================
local map = vim.keymap.set

-- Plugin Mappings
map({ 'n', 'v' }, '<C-n>', ':NERDTreeToggle<CR>', { silent = true })
map('n', '<C-c>', '<Plug>CommentaryLine', { remap = true })

-- FZF Mappings
map('n', '<Leader>ff', ':Files<CR>', { silent = true })
map('n', '<Leader>fl', ':Lines<CR>', { silent = true })
map('n', '<Leader>fbl', ':BLines<CR>', { silent = true })
map('n', '<Leader>fob', ':Buffers<CR>', { silent = true })

-- EasyAlign
map({ 'n', 'x' }, 'ga', '<Plug>(EasyAlign)', { silent = true })

-- Terminal Shortcuts
map('t', '<Esc>', [[<C-\><C-n>]])
map('n', '<Leader>te', ':terminal<CR>', { silent = true })

-- Clear Search Highlighting
map('n', '<Esc>', ':noh<CR><Esc>', { silent = true })

-- Buffer Navigation
map({ 'n', 'v' }, '<C-left>', ':bprev<CR>', { silent = true })
map({ 'n', 'v' }, '<C-right>', ':bnext<CR>', { silent = true })
map('n', '<Leader>bd', ':bdelete %<CR>', { silent = true })
map('n', '<Leader>bc', ':%bd|e#|bd#<CR>', { silent = true })

-- Quick Paste & Clipboard Operations
map('n', '<Leader>p', '"0p')
map('n', '<Leader>c', ':%y+<CR>', { silent = true })

-- Hex Editing
map('n', '<Leader>h', ':%!xxd<CR>')
map('n', '<Leader>H', ':%!xxd -r<CR>')

-- Remove Trailing Whitespaces
map('n', '<Leader>tr', ':%s/\\s\\+$//e | :noh | :w<CR>', { silent = true })

-- Window Navigation
map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')
map('n', '<C-L>', '<C-W><C-L>')
map('n', '<C-H>', '<C-W><C-H>')

-- Window Resizing
map('n', '_', '<C-W><C-_>')
map('n', '|', ':vertical-resize CTRL-W_bar<CR>', { silent = true })
map('n', '=', '<C-W><C-=>')
map('n', '<down>', '<C-W><C-->')
map('n', '<up>', '<C-W><C-+>')
map('n', '<left>', ':vertical resize +1<CR>', { silent = true })
map('n', '<right>', ':vertical resize -1<CR>', { silent = true })
map('n', '<C-z>', '<C-W><C-z>')

-- ============================================================================
-- 5. AUTOCOMMANDS
-- ============================================================================
local augroup = vim.api.nvim_create_augroup('CustomAutocmds', { clear = true })

-- Change working directory to current file's directory
vim.api.nvim_create_autocmd('BufEnter', {
  group = augroup,
  pattern = '*',
  callback = function()
    pcall(vim.api.nvim_command, 'lcd %:p:h')
  end,
})

-- Format options adjustment
vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove({ 'o', 'r' })
  end,
})

-- Enforce filetypes
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup,
  pattern = '*.muttrc',
  command = 'setlocal syntax=neomuttrc',
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup,
  pattern = '*.mail',
  command = 'setlocal filetype=mail',
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup,
  pattern = '*.gdb',
  command = 'setlocal filetype=gdb',
})

-- Native Yank Highlight
vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup,
  desc = 'Highlight when yanking text',
  callback = function()
    vim.hl.on_yank({ timeout = 200 })
  end,
})

-- ============================================================================
-- NATIVE LSP & MASON CONFIGURATION
-- ============================================================================
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "jsonls", "vimls", "lua_ls"},
})

-- Common LSP keymaps when a language server attaches
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP Actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, opts)
  end,
})

local servers = { 'pyright', 'jsonls', 'vimls' }

for _, server in ipairs(servers) do
  vim.lsp.config(server, {})
  vim.lsp.enable(server)
end

-- Dedicated setup for lua_ls with custom settings
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
})
vim.lsp.enable('lua_ls')
