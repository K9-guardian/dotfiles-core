vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = true})

vim.api.nvim_create_user_command("W", "write", { nargs = "*" })
vim.api.nvim_create_user_command("Q", "quitall", { nargs = "*" })

vim.keymap.set("n", "ZR", function()
   local f = '/tmp/nvim-restart-' .. vim.fn.getpid() .. '.vim'
   vim.cmd('mksession! ' .. f)
   vim.fn.writefile({'call delete(' .. vim.fn.string(f) .. ')'}, f, 'a')
   vim.cmd('restart source ' .. f)
end)

vim.api.nvim_create_user_command("F", function()
   local view = vim.fn.winsaveview()
   vim.cmd("normal! gggqG")
   vim.fn.winrestview(view)
end, {})
vim.keymap.set("n", "<Leader>=", function()
   local view = vim.fn.winsaveview()
   vim.cmd("normal! gg=G")
   vim.fn.winrestview(view)
end, {})

vim.keymap.set('n', 'gy', function()
   local filename_base = vim.fn.expand('%:t')
   vim.fn.setreg('+', filename_base)
   vim.notify(filename_base, vim.log.levels.INFO)
end, {})
vim.keymap.set('n', 'gY', function()
   local filename_full = vim.fn.expand('%:p')
   vim.fn.setreg('+', filename_full)
   vim.notify(filename_full, vim.log.levels.INFO)
end, {})

vim.api.nvim_create_user_command("FileLink", function(opts)
   local reference = vim.fn.expand("%:p") .. ":" .. opts.line1
   if opts.line1 ~= opts.line2 then
      reference = reference .. "-" .. opts.line2
   end
   vim.fn.setreg("+", reference)
   vim.notify(reference, vim.log.levels.INFO)
end, { range = true })

vim.keymap.set({ "n", "v" }, "gl", ":FileLink<CR>", { silent = true })

vim.api.nvim_create_user_command("SudoWrite", function()
   vim.cmd("write !sudo tee % > /dev/null")
   vim.cmd.edit { bang = true }
end, {})

vim.keymap.set("n", "<Leader>r", "cgn<C-r>0<Esc>")
vim.keymap.set("n", "<Leader>R", "cgN<C-r>0<Esc>")
vim.keymap.set("n", "<Leader>h", "<Cmd>helpclose<CR>")

vim.keymap.set("n", "<C-&>", "<C-w>g<tab>", { silent = true })

vim.keymap.set("n", "<Leader>co", "<Cmd>copen<CR>")
vim.keymap.set("n", "<Leader>cc", "<Cmd>cclose<CR>")

vim.keymap.set("v", "<Enter>", "<Plug>(EasyAlign)")
vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")

vim.keymap.set("n", "<C-w><C-F>", "<Cmd>vertical wincmd f<CR>")
vim.keymap.set("n", "<C-w>f", "<Cmd>vertical wincmd f<CR>")
vim.keymap.set("v", "<C-w><C-F>", "<Cmd>vertical wincmd f<CR>")
vim.keymap.set("v", "<C-w>f", "<Cmd>vertical wincmd f<CR>")

-- Returns a function that checks if motion was used with a count.
-- If so, add position to the jumplist. Useful for big relative jumps like "20j".
local function count_motion_with_jump(motion)
   return function()
      local count = vim.v.count1
      if count > 1 then
         vim.cmd("normal! m'")
      end
      vim.cmd("normal! " .. count .. motion)
   end
end

vim.keymap.set("n", "j", count_motion_with_jump("j"))
vim.keymap.set("n", "k", count_motion_with_jump("k"))
