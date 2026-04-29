---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup {
   ensure_installed = {
      "clojure",
      "go",
      "haskell",
      "java",
      "javascript",
      "prolog",
      "python",
      "racket",
      "rust",
   },
   highlight = { enable = true },
   rainbow = {
      enable = true,
   },
}
