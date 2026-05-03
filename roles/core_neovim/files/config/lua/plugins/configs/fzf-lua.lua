require("fzf-lua").setup {
   winopts = {
      preview = {
         hidden = "nohidden",
         default = "bat"
      },
      width = 0.9,
      height = 0.9,
   },
}

vim.keymap.set("n", "<C-p>", "<Cmd>FzfLua combine pickers=buffers;files<CR>")
vim.keymap.set("n", "<C-S-p>", "<Cmd>FzfLua combine pickers=buffers;git_files<CR>")

vim.api.nvim_create_user_command('Rg', function(opts)
   require('fzf-lua').grep({
      search  = opts.args,
   })
end, { nargs = '*' })
vim.keymap.set("n", "<C-g>", "<Cmd>FzfLua combine pickers=grep_cword;grep_visual<CR>")

vim.api.nvim_create_user_command('History', function(opts)
   require('fzf-lua').oldfiles({
      search  = opts.args,
   })
end, {})
