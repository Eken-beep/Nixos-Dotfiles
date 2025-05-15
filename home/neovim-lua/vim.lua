local g = vim.g
local o = vim.o
local opt = vim.opt
local A   = vim.api

-- Settings
o.relativenumber = true
o.number = true
o.updatetime = 200
o.scrolloff = 8

-- Linebreaks and indents
o.expandtab = true
o.smarttab = true
o.autoindent = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = -1
o.wrap = true
o.colorcolumn = "80"
opt.linebreak = true
opt.breakindent = true
opt.backspace = "indent,eol,start"

opt.spell = true
opt.spelllang = { 'en', 'sv' }

o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = true
o.history = 50

g.mapleader = ' '
g.maplocalleader = ' '
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

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

require("glow").setup({
    width = 140,
    width_ratio = 0.8,
})

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    A.nvim_set_hl(0, "RainbowRed", { fg = "#F38BA8" })
    A.nvim_set_hl(0, "RainbowYellow", { fg = "#F9E2AF" })
    A.nvim_set_hl(0, "RainbowBlue", { fg = "#89B4FA" })
    A.nvim_set_hl(0, "RainbowOrange", { fg = "#FAB387" })
    A.nvim_set_hl(0, "RainbowGreen", { fg = "#A6E3A1" })
    A.nvim_set_hl(0, "RainbowViolet", { fg = "#CBA6F7" })
    A.nvim_set_hl(0, "RainbowCyan", { fg = "#94E2D5" })
end)

require("ibl").setup { indent = { highlight = highlight } }

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

-- Load vimtex compilation while in tex document
A.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
    pattern = { "*.tex", "latex" },
    command = ":VimtexCompile"
})

A.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
    pattern = {
        "*.tex",
        "*.md",
        "*.txt",
    },
    command = ":set colorcolumn='0'"
})

-- Special sauce for c
vim.cmd("autocmd FileType c setlocal shiftwidth=4 softtabstop=4 cindent")

-- KEYBINDINGS
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

local opts = {
    silent = true,
    noremap = true,
    expr = true,
    replace_keycodes = false
}
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
vim.keymap.set('n', '<leader>t', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', 'tf', builtin.find_files, {})
vim.keymap.set('n', ',', builtin.buffers, {})
vim.keymap.set('n', 'to', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fo', builtin.live_grep, {})
