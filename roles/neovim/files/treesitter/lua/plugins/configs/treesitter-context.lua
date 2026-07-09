require("treesitter-context").setup {
   multiline_threshold = 1,
   enable = false,
}

-- The plugin's cpp/context.scm has "; inherits: c" which neovim processes even
-- when our file takes the base slot, pulling in C's for/if/while queries.
-- query.set() bypasses file loading entirely.
vim.treesitter.query.set('cpp', 'context', [[
  (function_definition
    body: (_
      (_) @context.end)) @context
  (namespace_definition
    body: (_
      (_) @context.end)) @context
]])
vim.treesitter.query.set('python', 'context', [[
  (class_definition
    body: (_) @context.end) @context
  (function_definition
    body: (_) @context.end) @context
]])

vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
   callback = function()
      if vim.bo.filetype == "python" or vim.bo.filetype == "cpp" then
         require("treesitter-context").enable()
      else
         require("treesitter-context").disable()
      end
   end,
})
