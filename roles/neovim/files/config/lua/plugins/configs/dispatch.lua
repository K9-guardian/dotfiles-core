vim.g.dispatch_no_maps = 1
vim.api.nvim_create_user_command("M", function(opts)
   vim.cmd((opts.bang and "Make! " or "Make ") .. opts.args)
end, { nargs = "*", bang = true })
