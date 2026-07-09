local cmp = require("cmp")
local has_luasnip, luasnip = pcall(require, "luasnip")

cmp.setup({
   snippet = {
      expand = function(args)
         if has_luasnip then
            luasnip.lsp_expand(args.body)
         else
            vim.snippet.expand(args.body)
         end
      end,
   },
   mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
   }),
   sources = cmp.config.sources(
      has_luasnip
         and { { name = "nvim_lsp" }, { name = "luasnip" } }
         or  { { name = "nvim_lsp" } },
      { { name = "buffer" } }
   ),
})
