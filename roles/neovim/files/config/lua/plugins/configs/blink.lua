require("blink.cmp").setup({
   keymap = {
      preset = 'none',
      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      ['<C-Space>'] = { 'show', 'fallback' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<CR>'] = { 'select_and_accept', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },
   },
   completion = {
      accept = { create_undo_point = false },
      documentation = { auto_show = true },
      list = { selection = { preselect = false } },
   },
   snippets = {
      preset = pcall(require, "luasnip") and 'luasnip' or 'default',
   },
   sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
         buffer = {
            opts = {
               get_bufnrs = function()
                  return vim.tbl_filter(function(bufnr)
                     return vim.bo[bufnr].buftype == ''
                  end, vim.api.nvim_list_bufs())
               end,
            },
         },
      },
   },
})
