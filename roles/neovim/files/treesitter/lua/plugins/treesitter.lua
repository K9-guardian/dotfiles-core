vim.pack.add({
   'https://github.com/neovim-treesitter/nvim-treesitter',
   'https://github.com/neovim-treesitter/treesitter-parser-registry',
   'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
   'https://github.com/HiPhish/rainbow-delimiters.nvim',
   'https://github.com/nvim-treesitter/nvim-treesitter-context',
})

require("plugins.configs.treesitter")
require("plugins.configs.treesitter-textobjects")
require("plugins.configs.treesitter-context")
