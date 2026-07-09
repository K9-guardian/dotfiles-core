require("nvim-treesitter-textobjects").setup {
   select = {
      lookahead = true,
      include_surrounding_whitespace = function(opts)
         local q = opts.query_string
         return (q:find("function") or q:find("class")) and q:find("outer") ~= nil
      end,
   },
   move = {
      set_jumps = true,
   },
}

local select_textobject = require("nvim-treesitter-textobjects.select").select_textobject
for _, map in ipairs({
   { "av", "@parameter.outer" },
   { "iv", "@parameter.inner" },
   { "af", "@function.outer" },
   { "if", "@function.inner" },
   { "au", "@call.outer" },
   { "iu", "@call.inner" },
   { "ac", "@class.outer" },
   { "ic", "@class.inner" },
   { "as", "@conditional.outer" },
   { "is", "@conditional.inner" },
   { "al", "@loop.outer" },
   { "il", "@loop.inner" },
}) do
   vim.keymap.set({ "x", "o" }, map[1], function()
      select_textobject(map[2], "textobjects")
   end)
end

local move = require("nvim-treesitter-textobjects.move")
for _, map in ipairs({
   { "]v", move.goto_next_start, "@parameter.inner" },
   { "]f", move.goto_next_start, "@function.outer" },
   { "]c", move.goto_next_start, "@class.outer" },
   { ")", move.goto_next_start, "@statement.outer" },
   { "]V", move.goto_next_end, "@parameter.outer" },
   { "]F", move.goto_next_end, "@function.outer" },
   { "]C", move.goto_next_end, "@class.outer" },
   { "[v", move.goto_previous_start, "@parameter.inner" },
   { "[f", move.goto_previous_start, "@function.outer" },
   { "[c", move.goto_previous_start, "@class.outer" },
   { "(", move.goto_previous_start, "@statement.outer" },
   { "[V", move.goto_previous_end, "@parameter.outer" },
   { "[F", move.goto_previous_end, "@function.outer" },
   { "[C", move.goto_previous_end, "@class.outer" },
}) do
   vim.keymap.set({ "n", "x", "o" }, map[1], function()
      map[2](map[3], "textobjects")
   end)
end

local swap = require("nvim-treesitter-textobjects.swap")
vim.keymap.set("n", "<Leader>v", function() swap.swap_next("@parameter.inner") end)
vim.keymap.set("n", "<Leader>V", function() swap.swap_previous("@parameter.inner") end)

local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
