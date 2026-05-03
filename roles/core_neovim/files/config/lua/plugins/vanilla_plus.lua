return function(use)
   use { "folke/tokyonight.nvim", config = function() require("plugins.configs.tokyonight") end }

   use "farmergreg/vim-lastplace"
   use { "haya14busa/vim-asterisk", config = function()
      vim.keymap.set({ "n", "v" }, "*", "<Plug>(asterisk-z*)")
      vim.keymap.set({ "n", "v" }, "#", "<Plug>(asterisk-z#)")
      vim.keymap.set({ "n", "v" }, "g*", "<Plug>(asterisk-gz*)")
      vim.keymap.set({ "n", "v" }, "g#", "<Plug>(asterisk-gz#)")
      vim.g["asterisk#keeppos"] = 1
   end }
   use "junegunn/vim-easy-align"
   use "michaeljsmith/vim-indent-object"
   use "tpope/vim-commentary"
   use "tpope/vim-fugitive"
   use "tpope/vim-repeat"
   use { "tpope/vim-surround", config = function()
      vim.keymap.set("n", "s", "<Plug>Ysurround")
      vim.keymap.set("n", "S", "<Plug>YSurround")
      vim.keymap.set("n", "ss", "<Plug>Yssurround")
      vim.keymap.set("n", "Ss", "<Plug>YSsurround")
      vim.keymap.set("n", "SS", "<Plug>YSsurround")
      vim.keymap.set("x", "s", "<Plug>VSurround")
      vim.keymap.set("x", "gs", "<Plug>VgSurround")
   end }
   use "tpope/vim-unimpaired"

   use { "hrsh7th/nvim-cmp", config = function() require("plugins.configs.nvim-cmp") end }
   use { "hrsh7th/cmp-buffer", requires = { "hrsh7th/nvim-cmp" } }
   use { "hrsh7th/cmp-cmdline", requires = { "hrsh7th/nvim-cmp" } }
   use { "hrsh7th/cmp-path", requires = { "hrsh7th/nvim-cmp" } }

   use {
      "ibhagwan/fzf-lua",
      config = function() require("plugins.configs.fzf-lua") end,
      requires = { "nvim-tree/nvim-web-devicons" },
   }
   use { "stevearc/oil.nvim", config = function()
      require("oil").setup {
         view_options = {
            show_hidden = true,
         },
         use_default_keymaps = false,
         keymaps = {
            ["<CR>"] = "actions.select",
            ["-"] = { "actions.parent", mode = "n" },
         },
         skip_confirm_for_simple_edits = true,
      }

      vim.keymap.set("n", "<Leader>e", "<Cmd>Oil<CR>", {})
   end }

   use {
      "nvim-treesitter/nvim-treesitter",
      branch = "master",
      run = ":TSUpdate",
   }
   use {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "master",
      requires = { "nvim-treesitter/nvim-treesitter" },
      config = function() require("plugins.configs.treesitter") end,
   }
   use {
      "HiPhish/rainbow-delimiters.nvim",
      commit = "3277ad5f96eb03c9d618c88e24f683e4364e578c",
      requires = { "nvim-treesitter/nvim-treesitter" }
   }
end
