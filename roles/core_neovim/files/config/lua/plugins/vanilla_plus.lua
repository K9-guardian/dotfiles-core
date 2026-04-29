return function(use)
   use { "folke/tokyonight.nvim", config = function() require("plugins.configs.tokyonight") end }

   use "farmergreg/vim-lastplace"
   use "junegunn/vim-easy-align"
   use "michaeljsmith/vim-indent-object"
   use "tpope/vim-commentary"
   use "tpope/vim-fugitive"
   use "tpope/vim-repeat"
   use { "tpope/vim-surround", config = function() require("plugins.configs.surround") end }
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

   use {
      "nvim-treesitter/nvim-treesitter",
      branch = "master",
      config = function() require("plugins.configs.treesitter") end,
      run = ":TSUpdate",
   }
   use {
      "HiPhish/rainbow-delimiters.nvim",
      commit = "3277ad5f96eb03c9d618c88e24f683e4364e578c",
      requires = { "nvim-treesitter/nvim-treesitter" }
   }
end
