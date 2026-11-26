vim.opt_local.expandtab = false
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2

if vim.fn.executable("stylua") == 1 then
	local file = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
	vim.bo.formatprg = "stylua --stdin-filepath " .. file .. " -"
end
