require("nvim-treesitter").install {
   "clojure", "cpp", "go", "haskell", "java", "javascript",
   "lua", "prolog", "python", "query", "racket", "rust",
}

vim.api.nvim_create_autocmd("FileType", {
   callback = function()
      if vim.treesitter.get_parser(0, vim.bo.filetype, { error = false }) then
         vim.treesitter.start()
      end
   end,
})

vim.keymap.set("n", "<C-S-o>", function()
   require("fzf-lua").treesitter({
      node_filter = function(_, kind)
         return kind == "function" or kind == "type"
      end,
   })
end)
