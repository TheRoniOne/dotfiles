local o = vim.o
local wo = vim.wo
local bo = vim.bo

o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.errorbells = false
o.smarttab = true

wo.number = true
wo.cursorline = true

bo.fileencoding = 'utf-8'
bo.autoindent = true
bo.tabstop = 4
bo.expandtab = true

