vim.pack.add({
   'https://github.com/folke/tokyonight.nvim',
   'https://github.com/farmergreg/vim-lastplace',
   'https://github.com/haya14busa/vim-asterisk',
   'https://github.com/junegunn/vim-easy-align',
   'https://github.com/michaeljsmith/vim-indent-object',
   'https://github.com/tpope/vim-commentary',
   'https://github.com/tpope/vim-fugitive',
   'https://github.com/tpope/vim-repeat',
   'https://github.com/tpope/vim-surround',
   'https://github.com/tpope/vim-unimpaired',
   'https://github.com/tpope/vim-dispatch',
   'https://github.com/radenling/vim-dispatch-neovim',
   'https://github.com/hrsh7th/nvim-cmp',
   'https://github.com/hrsh7th/cmp-buffer',
   'https://github.com/hrsh7th/cmp-cmdline',
   'https://github.com/hrsh7th/cmp-path',
   'https://github.com/ibhagwan/fzf-lua',
   'https://github.com/nvim-tree/nvim-web-devicons',
   'https://github.com/stevearc/oil.nvim',
})

-- vim.pack.add({
--    'https://github.com/nvim-treesitter/nvim-treesitter',
--    'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
--    'https://github.com/HiPhish/rainbow-delimiters.nvim',
-- })

require("plugins.configs.tokyonight")
require("plugins.configs.asterisk")
require("plugins.configs.surround")
require("plugins.configs.dispatch")
require("plugins.configs.nvim-cmp")
require("plugins.configs.fzf-lua")
require("plugins.configs.oil")
