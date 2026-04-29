return function(use)
   use "folke/tokyonight.nvim"

   use "farmergreg/vim-lastplace"
   use "junegunn/vim-easy-align"
   use "michaeljsmith/vim-indent-object"
   use "tpope/vim-commentary"
   use "tpope/vim-fugitive"
   use "tpope/vim-repeat"
   use "tpope/vim-surround"
   use "tpope/vim-unimpaired"

   use "hrsh7th/nvim-cmp"
   use { "hrsh7th/cmp-buffer", requires = { "hrsh7th/nvim-cmp" } }
   use { "hrsh7th/cmp-cmdline", requires = { "hrsh7th/nvim-cmp" } }
   use { "hrsh7th/cmp-path", requires = { "hrsh7th/nvim-cmp" } }

   use { "ibhagwan/fzf-lua", requires = { "nvim-tree/nvim-web-devicons" } }

   use { "nvim-treesitter/nvim-treesitter", branch = "master", run = ":TSUpdate" }
   use { "HiPhish/rainbow-delimiters.nvim", requires = { "nvim-treesitter/nvim-treesitter" } }
end
