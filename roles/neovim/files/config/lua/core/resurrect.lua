local window_snapshots = {}
local closed_stack = {}

local function is_named_file_buffer(buffer)
   return vim.bo[buffer].buftype == "" and vim.api.nvim_buf_get_name(buffer) ~= ""
end

local function update_window_snapshots()
   local buffer = vim.api.nvim_get_current_buf()
   local window = vim.api.nvim_get_current_win()
   if is_named_file_buffer(buffer) then
      window_snapshots[window] = vim.api.nvim_buf_get_name(buffer)
   else
      window_snapshots[window] = nil
   end
end

local function on_window_closed(event)
   local window_id = tonumber(event.match)
   if not window_snapshots[window_id] then return end
   table.insert(closed_stack, window_snapshots[window_id])
   window_snapshots[window_id] = nil
end

local augroup = vim.api.nvim_create_augroup("resurrect", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
   group = augroup,
   callback = update_window_snapshots,
})

vim.api.nvim_create_autocmd("WinClosed", {
   group = augroup,
   callback = on_window_closed,
})

vim.keymap.set("n", "<Leader>t", function()
   if #closed_stack == 0 then
      vim.notify("Nothing to resurrect", vim.log.levels.INFO)
      return
   end
   vim.cmd("tabnew " .. vim.fn.fnameescape(table.remove(closed_stack)))
end, { silent = false })
