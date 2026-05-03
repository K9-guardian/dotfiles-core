require("nvim-treesitter.configs").setup {
   ensure_installed = {
      "clojure",
      "go",
      "haskell",
      "java",
      "javascript",
      "prolog",
      "python",
      "query",
      "racket",
      "rust",
   },
   highlight = { enable = true },

   textobjects = {
      move = {
         enable = true,
         set_jumps = true,
         goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            [")"] = "@statement.outer",
         },
         goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
         },
         goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["("] = "@statement.outer",
         },
         goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
         },
      },

      -- TODO: Use mini.ai for this.
      --       I want to cover all the major programming constructs with queries.
      select = {
         -- enable = true,
         lookahead = true,
         keymaps = {
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
         },
         include_surrounding_whitespace = true,
      },

      swap = {
         enable = true,
         lookahead = true,
         swap_next = {
            ["]a"] = "@parameter.inner",
         },
         swap_previous = {
            ["[a"] = "@parameter.inner",
         },
      },
   },
}
