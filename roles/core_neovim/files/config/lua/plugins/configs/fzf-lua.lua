require("fzf-lua").setup {
   winopts = {
      border = "none",
      fullscreen = true,
      preview = {
         border = "none",
      }
   },
}

vim.keymap.set("n", "<C-p>", "<Cmd>FzfLua combine pickers=buffers;files<CR>")
vim.keymap.set('n', '<C-S-p>', function()
   FzfLua.combine({
      pickers = "buffers;git_files",
      cwd = FzfLua.path.git_root({}),
   })
end)

vim.api.nvim_create_user_command('Rg', function(opts)
   FzfLua.grep({ search  = opts.args })
end, { nargs = '*' })
vim.keymap.set("n", "<C-g>", "<Cmd>FzfLua combine pickers=grep_cword;grep_visual<CR>")

vim.api.nvim_create_user_command('History', function(opts)
   FzfLua.oldfiles({ search  = opts.args })
end, {})
