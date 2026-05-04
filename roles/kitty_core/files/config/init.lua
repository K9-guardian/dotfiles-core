vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.laststatus = 0
vim.opt.clipboard = { "unnamedplus" }

vim.keymap.set("n", "q", "<Cmd>quit!<CR>")
vim.keymap.set("n", "<C-c>", "<Cmd>quit!<CR>")
vim.keymap.set("n", "<C-[>", "<Cmd>quit!<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
   callback = function(_) vim.defer_fn(function(_) vim.cmd("quit!") end, 0) end
})
