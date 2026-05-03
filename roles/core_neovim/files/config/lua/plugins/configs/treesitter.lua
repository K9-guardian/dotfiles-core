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
            return (q:find('function') or q:find('class')) and q:find('outer') ~= nil
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

vim.keymap.set("n", "c2iv", "2]vciv", { remap = true })
vim.keymap.set("n", "c3iv", "3]vciv", { remap = true })
vim.keymap.set("n", "c4iv", "4]vciv", { remap = true })
vim.keymap.set("n", "c5iv", "5]vciv", { remap = true })
vim.keymap.set("n", "c6iv", "6]vciv", { remap = true })
vim.keymap.set("n", "c7iv", "7]vciv", { remap = true })
vim.keymap.set("n", "c8iv", "8]vciv", { remap = true })
vim.keymap.set("n", "c9iv", "9]vciv", { remap = true })

vim.keymap.set("n", "c2av", "2]vcav", { remap = true })
vim.keymap.set("n", "c3av", "3]vcav", { remap = true })
vim.keymap.set("n", "c4av", "4]vcav", { remap = true })
vim.keymap.set("n", "c5av", "5]vcav", { remap = true })
vim.keymap.set("n", "c6av", "6]vcav", { remap = true })
vim.keymap.set("n", "c7av", "7]vcav", { remap = true })
vim.keymap.set("n", "c8av", "8]vcav", { remap = true })
vim.keymap.set("n", "c9av", "9]vcav", { remap = true })

vim.keymap.set("n", "d2iv", "2]vdiv", { remap = true })
vim.keymap.set("n", "d3iv", "3]vdiv", { remap = true })
vim.keymap.set("n", "d4iv", "4]vdiv", { remap = true })
vim.keymap.set("n", "d5iv", "5]vdiv", { remap = true })
vim.keymap.set("n", "d6iv", "6]vdiv", { remap = true })
vim.keymap.set("n", "d7iv", "7]vdiv", { remap = true })
vim.keymap.set("n", "d8iv", "8]vdiv", { remap = true })
vim.keymap.set("n", "d9iv", "9]vdiv", { remap = true })

vim.keymap.set("n", "d2av", "2]vdav", { remap = true })
vim.keymap.set("n", "d3av", "3]vdav", { remap = true })
vim.keymap.set("n", "d4av", "4]vdav", { remap = true })
vim.keymap.set("n", "d5av", "5]vdav", { remap = true })
vim.keymap.set("n", "d6av", "6]vdav", { remap = true })
vim.keymap.set("n", "d7av", "7]vdav", { remap = true })
vim.keymap.set("n", "d8av", "8]vdav", { remap = true })
vim.keymap.set("n", "d9av", "9]vdav", { remap = true })

vim.keymap.set("n", "v2iv", "2]vviv", { remap = true })
vim.keymap.set("n", "v3iv", "3]vviv", { remap = true })
vim.keymap.set("n", "v4iv", "4]vviv", { remap = true })
vim.keymap.set("n", "v5iv", "5]vviv", { remap = true })
vim.keymap.set("n", "v6iv", "6]vviv", { remap = true })
vim.keymap.set("n", "v7iv", "7]vviv", { remap = true })
vim.keymap.set("n", "v8iv", "8]vviv", { remap = true })
vim.keymap.set("n", "v9iv", "9]vviv", { remap = true })

vim.keymap.set("n", "v2av", "2]vvav", { remap = true })
vim.keymap.set("n", "v3av", "3]vvav", { remap = true })
vim.keymap.set("n", "v4av", "4]vvav", { remap = true })
vim.keymap.set("n", "v5av", "5]vvav", { remap = true })
vim.keymap.set("n", "v6av", "6]vvav", { remap = true })
vim.keymap.set("n", "v7av", "7]vvav", { remap = true })
vim.keymap.set("n", "v8av", "8]vvav", { remap = true })
vim.keymap.set("n", "v9av", "9]vvav", { remap = true })
