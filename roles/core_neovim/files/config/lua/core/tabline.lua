local function render()
   local result = ""
   for tab_index = 1, vim.fn.tabpagenr("$") do
      local is_current = tab_index == vim.fn.tabpagenr()
      local window_number = vim.fn.tabpagewinnr(tab_index)
      local buffer_number = vim.fn.tabpagebuflist(tab_index)[window_number]
      local buffer_name = vim.fn.bufname(buffer_number)
      local filename = buffer_name ~= "" and vim.fn.fnamemodify(buffer_name, ":t") or "[No Name]"

      local is_modified = false
      for _, buf in ipairs(vim.fn.tabpagebuflist(tab_index)) do
         if vim.fn.getbufvar(buf, "&modified") == 1 then
            is_modified = true
            break
         end
      end

      result = result .. "%" .. tab_index .. "T"
      result = result .. (is_current and "%#TabLineSel#" or "%#TabLine#")
      result = result .. " " .. tab_index .. ":" .. filename
      if is_modified then
         result = result .. " [+]"
      end
      result = result .. " "
   end
   return result .. "%T%#TabLineFill#"
end

vim.opt.tabline = "%!v:lua.require('core.tabline').render()"

return { render = render }
