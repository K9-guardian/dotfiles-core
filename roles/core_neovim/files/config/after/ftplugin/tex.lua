vim.b.surround_81 = "``\r''"
vim.b.surround_113 = "`\r'"

vim.g.vimtex_syntax_nospell_comments = 1
vim.opt_local.spell = true

local opts = { buffer = true }

-- TODO: Make an abbreviation to open the hw file lol
-- vim.keymap.set("c", "hw", function()
--    os.execute("ls")
-- end, opts)

vim.keymap.set("n", "dsm", "<Plug>(vimtex-env-delete-math)", opts)
vim.keymap.set("n", "csm", "<Plug>(vimtex-env-change-math)", opts)
vim.keymap.set("n", "tsm", "<Plug>(vimtex-env-toggle-math)", opts)

vim.keymap.set({ "o", "x" }, "am", "<Plug>(vimtex-a$)", opts)
vim.keymap.set({ "o", "x" }, "im", "<Plug>(vimtex-i$)", opts)
vim.keymap.set({ "o", "x" }, "ai", "<Plug>(vimtex-am)", opts)
vim.keymap.set({ "o", "x" }, "ii", "<Plug>(vimtex-im)", opts)
