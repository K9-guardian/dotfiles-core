require("oil").setup {
   view_options = {
      show_hidden = true,
   },
   use_default_keymaps = false,
   keymaps = {
      ["<CR>"] = "actions.select",
      ["-"] = { "actions.parent", mode = "n" },
      ["<C-c>"] = { "actions.close", mode = "n" },
      ["gy"] = {
         function()
            require("oil.actions").yank_entry.callback({ modify = ":t" })
            require("oil.actions").close.callback()
            vim.notify(vim.fn.getreg(vim.v.register), vim.log.levels.INFO)
         end,
         mode = "n",
      },
      ["gY"] = {
         function()
            require("oil.actions").yank_entry.callback({ modify = ":p" })
            require("oil.actions").close.callback()
            vim.notify(vim.fn.getreg(vim.v.register), vim.log.levels.INFO)
         end,
         mode = "n",
      },
      ["g<C-y>"] = {
         function()
            local oil = require("oil")
            local entry = oil.get_cursor_entry()
            local dir = oil.get_current_dir()
            if not entry or not dir then
               return
            end
            local target = vim.fn.resolve(dir .. entry.name)
            local orig_dir = vim.fn.resolve(vim.fn.fnamemodify(
               vim.api.nvim_buf_get_name(vim.w.oil_original_buffer), ":h"
            ))
            local relpath = require("core.paths").relpath(target, orig_dir)
            vim.fn.setreg('+', relpath)
            require("oil.actions").close.callback()
            vim.notify(relpath, vim.log.levels.INFO)
         end,
         mode = "n",
      },
   },
   skip_confirm_for_simple_edits = true,
}

vim.keymap.set("n", "-", "<Cmd>Oil<CR>")
