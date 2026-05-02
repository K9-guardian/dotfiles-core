vim.keymap.set("c", "<C-a>", "<Home>")

vim.keymap.set("n", "<Leader>w", "<Cmd>write<CR>")

vim.keymap.set("n", "<Leader>h", "<Cmd>helpclose<CR>")

vim.keymap.set('n', '<leader>e', function()
   local view = vim.fn.winsaveview()
   vim.cmd('keepjumps normal! gg=G')
   vim.fn.winrestview(view)
end, { silent = true })

vim.keymap.set('n', '<leader>f', function()
   if vim.bo.formatprg == '' then
      return
   end
   local view = vim.fn.winsaveview()
   vim.cmd('keepjumps normal! gggqG')
   vim.fn.winrestview(view)
end, { silent = true })

vim.keymap.set("n", "<C-^>", "<C-w>g<tab>", { silent = true })

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

-- Returns a function that search for the word under the cursor.
-- If the cursor is already on the word, keep the cursor there.
-- Otherwise, move the cursor to the next occurrence.
local function search_word_anchor(flags)
   return function()
      flags = flags or ""
      local current_hlsearch = vim.v.hlsearch
      local last_pattern = vim.fn.getreg("/")
      local pattern

      -- Get pattern (either word under cursor or visual selection)
      local in_visual_mode = vim.api.nvim_get_mode().mode:find("[vV]")
      if in_visual_mode then
         vim.cmd('noautocmd normal! y')
         local selected_text = vim.fn.getreg('"')
         pattern = vim.fn.escape(selected_text, "\\/.*$^~[]")
      else
         local word = vim.fn.expand("<cword>")
         pattern = "\\<" .. vim.fn.escape(word, "\\/.*$^~[]") .. "\\>"
      end

      vim.fn.setreg("/", pattern)
      vim.v.hlsearch = true
      vim.cmd("normal! m'")

      if in_visual_mode then
         vim.api.nvim_input("<Esc>")
      end

      if last_pattern == pattern and current_hlsearch ~= 0 then
         vim.fn.search(pattern, flags .. "W")
      else
         vim.fn.search(pattern, flags .. "cn")
      end

      -- Set search direction
      if flags:find("b") then
         vim.v.searchforward = 0
      else
         vim.v.searchforward = 1
      end
   end
end

vim.keymap.set({ "n", "x" }, "*", search_word_anchor())
vim.keymap.set({ "n", "x" }, "#", search_word_anchor("b"))

vim.keymap.set("n", "<Leader>m", function()
   local input = vim.fn.input("Move to: ")
   if input == "" then
      return
   end

   if input:sub(1, 1) == "+" or input:sub(1, 1) == "-" then
      vim.cmd("tabmove " .. input)
   else
      local target = tonumber(input)
      if target < 1 or target > vim.fn.tabpagenr("$") then
         print(input .. " out of range")
         return
      end
      -- :tabmove N means "after the tab currently at position N", so moving right
      -- requires N (not N-1) because the departure of the current tab doesn't shift
      -- the target reference; moving left requires N-1 for the same reason.
      if vim.fn.tabpagenr() < target then
         vim.cmd("tabmove " .. target)
      else
         vim.cmd("tabmove " .. (target - 1))
      end
   end
end)
