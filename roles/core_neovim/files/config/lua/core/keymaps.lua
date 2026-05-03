vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set('i', '<C-c>', '<Esc>', { noremap = true})

vim.api.nvim_create_user_command('W', 'write', { nargs = '*' })
vim.api.nvim_create_user_command('Q', 'quitall', { nargs = '*' })

vim.keymap.set('n', '<Leader>r', 'cgn<C-r>0<Esc>')
vim.keymap.set('n', '<Leader>R', 'cgN<C-r>0<Esc>')
vim.keymap.set("n", "<Leader>h", "<Cmd>helpclose<CR>")
vim.keymap.set("n", "<Leader>b", "<Cmd>bdelete<CR>")

vim.keymap.set('n', '<Leader>=', function()
   local view = vim.fn.winsaveview()
   vim.cmd('keepjumps normal! gg=G')
   vim.fn.winrestview(view)
end, { silent = true })

vim.keymap.set("n", "<C-&>", "<C-w>g<tab>", { silent = true })

vim.keymap.set("n", "<Leader>co", "<Cmd>copen<CR>")
vim.keymap.set("n", "<Leader>cc", "<Cmd>cclose<CR>")

vim.keymap.set("v", "<Enter>", "<Plug>(EasyAlign)")
vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")

vim.keymap.set("n", "<C-w><C-F>", "<Cmd>vertical wincmd f<CR>")
vim.keymap.set("n", "<C-w>f", "<Cmd>vertical wincmd f<CR>")
vim.keymap.set("v", "<C-w><C-F>", "<Cmd>vertical wincmd f<CR>")
vim.keymap.set("v", "<C-w>f", "<Cmd>vertical wincmd f<CR>")

-- Add jumps for paging
vim.keymap.set("n", "<C-d>", "m'<C-d>")
vim.keymap.set("n", "<C-u>", "m'<C-u>")
vim.keymap.set("n", "<C-f>", "m'<C-f>")
vim.keymap.set("n", "<C-b>", "m'<C-b>")

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
