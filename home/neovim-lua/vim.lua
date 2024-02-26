local g = vim.g
local o = vim.o
local opt = vim.opt
local A   = vim.api

-- Settings
o.relativenumber = true
o.number = true
o.updatetime = 200
o.scrolloff = 8

-- Editing settings with tab and similar
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = -1

o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = true
o.history = 50

g.mapleader = ' '
g.maplocalleader = ' '
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.zig_fmt_autosave = 0

A.nvim_set_option("clipboard","unnamed")

opt.termguicolors = true

require("nvim-treesitter.configs").setup {
    auto_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    indent = {
        enable = true
    }
}

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  }
})

require("illuminate").configure({
    providers = {'treesitter', 'regex'}
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

-- KEYBINDINGS
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Line navigation in insert mode like emacs
map('i', '<C-E>', '<ESC>A')
map('i', '<C-A>', '<ESC>I')

-- Quicksave & exit
map('n', '<C-x>', ':wq<CR>')
map('n', '<C-S-x>', ':q!<CR>')
map('n', '<C-s>', ':w<CR>')
map('n', '<C-t>e', ':NvimTreeOpen<CR>')

-- Tab modes
map('n', '<C-l>', ':bprev<CR>')
map('n', '<C-d>', ':bnext<CR>')
map('n', '<C-g>', ':bdelete<CR>')

-- Splits
map('n', '<leader>sv', ':vs<CR>')
map('n', '<leader>sh', ':split<CR>')

map('n', '<leader><left>', '<C-w>h')
map('n', '<leader><down>', '<C-w>j')
map('n', '<leader><up>', '<C-w>k')
map('n', '<leader><right>', '<C-w>l')

-- Treesitter
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'tf', builtin.find_files, {})
vim.keymap.set('n', ',', builtin.buffers, {})
vim.keymap.set('n', 'to', builtin.oldfiles, {})
