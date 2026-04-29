local luasnip = require("luasnip")
luasnip.config.setup({ enable_autosnippets = true })

vim.keymap.set({ "i", "s" }, "<Tab>", function()
   return luasnip.jumpable(1) and "<Cmd>lua require 'luasnip'.jump(1)<CR>" or "<Tab>"
end, { expr = true })
vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
   return luasnip.jumpable(-1) and "<Cmd>lua require 'luasnip'.jump(-1)<CR>" or "<S-Tab>"
end)

---@diagnostic disable-next-line: assign-type-mismatch
require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets" })

vim.api.nvim_create_user_command("EditSnippets", function(_)
   require("luasnip.loaders").edit_snippet_files({})
end, {})
