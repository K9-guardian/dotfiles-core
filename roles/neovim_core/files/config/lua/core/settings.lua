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

vim.api.nvim_create_autocmd("TextYankPost", {
   callback = function(_) vim.highlight.on_yank() end,
   group = vim.api.nvim_create_augroup("highlight_on_yank", {}),
})

vim.opt.updatetime = 100

vim.opt.spelllang = "en_us"

vim.opt.exrc = true

vim.g["conjure#filetypes"] = { "clojure", "racket" }
vim.g.sexp_filetypes = 'clojure,racket'
