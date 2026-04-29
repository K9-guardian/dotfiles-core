vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = { "unnamedplus" }

vim.opt.completeopt = { "menu", "noinsert", "noselect" }

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.autoindent = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrapscan = false

vim.opt.conceallevel = 2
vim.opt.colorcolumn = "100"

vim.g.mapleader = ","
vim.g.maplocalleader = " "

vim.opt.updatetime = 100

vim.opt.spelllang = "en_us"

vim.g["conjure#filetypes"] = { "clojure", "racket" }
