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

-- Only enable swapfiles when a buffer is modified.
vim.opt.swapfile = false

vim.api.nvim_create_augroup("swapfile_on_modified", {})
vim.api.nvim_create_autocmd("BufModifiedSet", {
   group = "swapfile_on_modified",
   callback = function()
      if vim.bo.modified and not vim.opt.swapfile:get() then
         vim.opt.swapfile = true
      end
   end
})
vim.api.nvim_create_autocmd("BufWritePost", {
   group = "swapfile_on_modified",
   callback = function()
      vim.opt.swapfile = false
      local swap = vim.fn.swapname(vim.api.nvim_get_current_buf())
      if swap ~= "" then
         os.remove(swap)
      end
   end
})

vim.opt.updatetime = 100

vim.opt.spelllang = "en_us"

vim.opt.exrc = true

vim.g["conjure#filetypes"] = { "clojure", "racket" }
vim.g.sexp_filetypes = "clojure,racket"
