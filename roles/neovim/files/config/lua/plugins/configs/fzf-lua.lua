require("fzf-lua").setup {
   winopts = {
      border = "none",
      fullscreen = true,
      preview = {
         border = "none",
      },
   },
}

vim.keymap.set("n", "<C-p>", "<Cmd>FzfLua files<CR>")
vim.keymap.set("n", "<C-S-p>", "<Cmd>FzfLua git_files<CR>")
vim.keymap.set("n", "<Leader>b", function()
   for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      local name = vim.api.nvim_buf_get_name(buf)
      if name ~= "" and vim.bo[buf].buflisted and vim.fn.filereadable(name) == 0 then
         vim.api.nvim_buf_delete(buf, {})
      end
   end
   FzfLua.buffers()
end)

vim.api.nvim_create_user_command("Rg", function(opts)
   FzfLua.grep({ search  = opts.args })
end, { nargs = "*" })
vim.keymap.set({ "n" }, "<C-g>", "<Cmd>FzfLua grep_cword<CR>")
vim.keymap.set({ "v" }, "<C-g>", "<Cmd>FzfLua grep_visual<CR>")

vim.api.nvim_create_user_command("History", function(opts)
   FzfLua.oldfiles({ search  = opts.args })
end, {})
