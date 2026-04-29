vim.api.nvim_create_augroup("highlight_on_yank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
   callback = function(_) vim.highlight.on_yank() end,
   group = "highlight_on_yank",
})
