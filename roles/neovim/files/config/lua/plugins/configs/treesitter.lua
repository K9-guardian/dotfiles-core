require("nvim-treesitter.configs").setup {
   ensure_installed = {
      "clojure",
      "cpp",
      "go",
      "haskell",
      "java",
      "javascript",
      "lua",
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
            ["]v"] = "@parameter.inner",
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            [")"] = "@statement.outer",
         },
         goto_next_end = {
            ["]V"] = "@parameter.outer",
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
         },
         goto_previous_start = {
            ["[v"] = "@parameter.inner",
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["("] = "@statement.outer",
         },
         goto_previous_end = {
            ["[V"] = "@parameter.outer",
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
         },
      },

      select = {
         enable = true,
         lookahead = true,
         keymaps = {
            ["av"] = "@parameter.outer",
            ["iv"] = "@parameter.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["au"] = "@call.outer",
            ["iu"] = "@call.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["as"] = "@conditional.outer",
            ["is"] = "@conditional.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
         },
         include_surrounding_whitespace = function(opts)
            local q = opts.query_string
            return (q:find("function") or q:find("class")) and q:find("outer") ~= nil
         end,
      },

      swap = {
         enable = true,
         lookahead = true,
         swap_next = {
            ["<Leader>v"] = "@parameter.inner",
         },
         swap_previous = {
            ["<Leader>V"] = "@parameter.inner",
         },
      },
   },
}

local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

vim.keymap.set("n", "<C-S-o>", function()
   require("fzf-lua").treesitter({
      node_filter = function(_, kind)
         return kind == "function" or kind == "type"
      end,
   })
end)
