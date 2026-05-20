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

rg_default_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e"
vim.api.nvim_create_user_command("Rg", function(opts)
   FzfLua.grep({ search = opts.args, rg_opts = "--follow " .. rg_default_opts })
end, { nargs = "*" })
vim.keymap.set({ "n" }, "<C-g>", function()
   FzfLua.grep_cword({ rg_opts = "--follow " .. rg_default_opts })
end)
vim.keymap.set("v", "<C-g>", function()
   FzfLua.grep_visual({ rg_opts = "--follow " .. rg_default_opts })
end)

vim.api.nvim_create_user_command("History", function(opts)
   FzfLua.oldfiles({ search  = opts.args })
end, {})

vim.keymap.set('n', 'g<C-y>', function()
   if vim.fn.expand('%:p') == '' then
      vim.notify("No file in current buffer", vim.log.levels.WARN)
      return
   end

   require("fzf-lua").files({
      actions = {
         ["default"] = function(selected, opts)
            local target = vim.fn.resolve(require("fzf-lua.path").entry_to_file(selected[1], opts).path)
            local current_dir = vim.fn.resolve(vim.fn.expand('%:p:h'))
            local relpath = require("core.paths").relpath(target, current_dir)
            vim.fn.setreg('+', relpath)
            vim.defer_fn(function() vim.notify(relpath, vim.log.levels.INFO) end, 100)
         end,
      },
   })
end, {})
