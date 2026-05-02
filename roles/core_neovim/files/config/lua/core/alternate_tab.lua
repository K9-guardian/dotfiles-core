local last_tab = nil

vim.api.nvim_create_autocmd("TabLeave", {
   group = vim.api.nvim_create_augroup("alternate_tab", { clear = true }),
   callback = function()
      last_tab = vim.fn.tabpagenr()
   end,
})

vim.keymap.set("n", "<C-^>", function()
   if last_tab and last_tab ~= vim.fn.tabpagenr() then
      vim.cmd("tabnext " .. last_tab)
   else
      vim.notify("No previous tab", vim.log.levels.INFO)
   end
end, { silent = true })
