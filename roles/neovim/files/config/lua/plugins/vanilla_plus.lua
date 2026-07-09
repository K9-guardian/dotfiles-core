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
   { src = 'https://github.com/Saghen/blink.cmp', version = 'v1' },
   'https://github.com/ibhagwan/fzf-lua',
   'https://github.com/nvim-tree/nvim-web-devicons',
   'https://github.com/stevearc/oil.nvim',
})

require("plugins.configs.tokyonight")
require("plugins.configs.asterisk")
require("plugins.configs.surround")
require("plugins.configs.dispatch")
require("plugins.configs.blink")
require("plugins.configs.fzf-lua")
require("plugins.configs.oil")
