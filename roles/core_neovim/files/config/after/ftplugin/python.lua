if vim.fn.executable("autopep8") == 1 then
   vim.bo.formatprg = "autopep8 -"
end
