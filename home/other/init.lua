local g = vim.g
local o = vim.o
local opt = vim.opt
local A   = vim.api

-- Settings
o.number = true;
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

-- Undo and backup settings
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = true

o.history = 50

-- leader key
g.mapleader = ' '
g.maplocalleader = ' '

-- Theme
local colors = {
  blue   = '#89b4fa',
  cyan   = '#89dceb',
  black  = '#1e1e2e',
  white  = '#cdd6f4',
  red    = '#f38ba8',
  violet = '#cba6f7',
  grey   = '#181825',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

-- KEYBINDINGS
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Line navigation in insert mode like emacs
map('i', '<C-E>', '<ESC>A')
map('i', '<C-A>', '<ESC>I')

-- Quicksave & exit
map('n', '<C-q>', ':wq<CR>')
map('n', '<C-x>', ':q!<CR>')
map('n', '<C-s>', ':w<CR>')

-- Coc.nvim config that for some reason has to be in vimscript...
vim.cmd([[
" Color hightlight for coc
highlight Pmenu ctermfg=White ctermbg=237
highlight PmenuSel ctermfg=White ctermbg=237
highlight FgCocErrorFloatBgCocFloating ctermfg=59 ctermbg=White guifg=White guibg=59

" Coc tab to trigger completion, vscode like behaviour
" but it failed
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

]])
