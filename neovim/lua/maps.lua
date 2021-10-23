local map = vim.api.nvim_set_keymap

map('n', '<Space>', '', {})
vim.g.mapleader = ' '

options = {noremap = true}
map('i', 'jj', '<Esc>', options)
map('n', '<leader>s', ':w', options)
