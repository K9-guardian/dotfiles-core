local M = {}

--- Compute relative path from directory `start` to `path`.
--- Matches Python's os.path.relpath(path, start).
function M.relpath(path, start)
   local function split(p)
      local parts = {}
      for part in p:gmatch("[^/]+") do
         parts[#parts + 1] = part
      end
      return parts
   end

   local path_parts = split(path)
   local start_parts = split(start)

   local common = 0
   for i = 1, math.min(#start_parts, #path_parts) do
      if start_parts[i] ~= path_parts[i] then
         break
      end
      common = i
   end

   local result = {}
   for _ = common + 1, #start_parts do
      result[#result + 1] = ".."
   end
   for i = common + 1, #path_parts do
      result[#result + 1] = path_parts[i]
   end

   return table.concat(result, "/")
end

return M
