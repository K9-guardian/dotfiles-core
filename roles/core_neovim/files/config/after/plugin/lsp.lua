vim.keymap.set("n", "<LocalLeader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<LocalLeader>q", vim.diagnostic.setloclist)

local on_attach = function(_, bufnr)
   vim.opt.signcolumn = "yes"

   local bufopts = { buffer = bufnr }

   vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
   vim.keymap.set("n", "<C-w><C-d>", function()
      vim.cmd("vsplit")
      vim.lsp.buf.definition()
   end, bufopts)
   vim.keymap.set("n", "<C-w>d", function()
      vim.cmd("vsplit")
      vim.lsp.buf.definition()
   end, bufopts)
   vim.keymap.set("n", "gh", vim.lsp.buf.hover, bufopts)
   vim.keymap.set("n", "gr", require("fzf-lua").lsp_references, bufopts)
   vim.keymap.set("n", "<LocalLeader>rn", vim.lsp.buf.rename, bufopts)
   vim.keymap.set("n", "<LocalLeader>ca", vim.lsp.buf.code_action, bufopts)
   vim.keymap.set({ "n", "v" }, "<LocalLeader>f", function() vim.lsp.buf.format({ async = true }) end, bufopts)

   local highlight_blacklist = { "prolog" }
   vim.api.nvim_create_augroup("lsp_highlight", {})
   vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      buffer = bufnr,
      callback = function(_)
         if vim.tbl_contains(highlight_blacklist, vim.opt.filetype:get()) then
            return
         end
         vim.lsp.buf.document_highlight()
      end,
      group = "lsp_highlight",
   })
   vim.api.nvim_create_autocmd({ "CursorMoved" }, {
      buffer = bufnr,
      callback = function(_)
         if vim.tbl_contains(highlight_blacklist, vim.opt.filetype:get()) then
            return
         end
         vim.lsp.buf.clear_references()
      end,
      group = "lsp_highlight",
   })

   local format_blacklist = { "java", "typescript", "typescriptreact", "python", "prolog" }
   vim.api.nvim_create_augroup("format_on_save", {})
   vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function(_)
         if vim.tbl_contains(format_blacklist, vim.opt.filetype:get()) then
            return
         end
         vim.lsp.buf.format()
      end,
      group = "format_on_save",
   })
end

require("mason").setup()
require("mason-lspconfig").setup {
   automatic_installation = true,
   -- TODO: Figure out good extensions for python and typescript
   ensure_installed = {
      "clojure_lsp",
      "gopls",
      -- "hls",
      "jdtls",
      "julials",
      "lua_ls",
      "rust_analyzer",
      "texlab",
      "tinymist"
   }
}

local lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lsp.clojure_lsp.setup({ on_attach = on_attach, capabilities = capabilities })
lsp.gopls.setup({ on_attach = on_attach, capabilities = capabilities })
lsp.hls.setup {
   on_attach = on_attach,
   capabilities = capabilities,
}
lsp.jdtls.setup({ on_attach = on_attach, capabilities = capabilities })
lsp.julials.setup({ on_attach = on_attach, capabilities = capabilities })
lsp.prolog_ls.setup({ on_attach = on_attach, capabilities = capabilities })
lsp.pyright.setup({ on_attach = on_attach, capabilities = capabilities })
lsp.racket_langserver.setup({ on_attach = on_attach, capabilities = capabilities })
lsp.rust_analyzer.setup {
   on_attach = on_attach,
   capabilities = capabilities,
   settings = { ["rust-analyzer"] = {} },
}
lsp.lua_ls.setup {
   on_attach = on_attach,
   capabilities = capabilities,
   settings = {
      Lua = {
         diagnostics = { globals = { "vim" } },
         runtime = { version = "LuaJIT" },
         workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      },
   },
}
lsp.texlab.setup {
   on_attach = on_attach,
   capabilities = capabilities,
   settings = {
      texlab = {
         chktex = {
            onEdit = true,
            onOpenAndSave = true,
         },
         diagnosticsDelay = 0,
         latexindent = { modifyLineBreaks = true },
      },
   },
}
lsp.tinymist.setup {
   on_attach = on_attach,
   capabilities = capabilities,
   settings = {
      formatterMode = "typstyle",
      exportPdf = "onType",
      semanticTokens = "disable"
   }
}
lsp.ts_ls.setup({ on_attach = on_attach, capabilities = capabilities })
