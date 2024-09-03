-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Local leader
vim.g.maplocalleader = ","

-- Scroll
vim.opt.scrolloff = 8

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Disable autoformat on save
vim.g.autoformat = false

-- Strict type checking for python
-- vim.g.lazyvim_python_lsp = "basedpyright"
-- Windows specific
if vim.fn.has("win32") == 1 then
  -- vim.o.shell = "C:/Program Files/Git/bin/bash.exe"
  vim.o.shell = "nu"
  -- Python
  vim.g.python3_host_prog = "C:/Users/Flake/AppData/Local/Programs/Python/Python312/python.exe"
end
