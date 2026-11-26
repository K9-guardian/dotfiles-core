local ok = pcall(require, "ftplugin_override.python")
if ok then
	return
end

if vim.fn.executable("ruff") == 1 then
	local file = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
	vim.bo.formatprg = "ruff format --stdin-filename " .. file .. " -"
end
