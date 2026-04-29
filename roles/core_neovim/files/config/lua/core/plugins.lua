local ensure_packer = function()
   local fn = vim.fn
   local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
   if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
      vim.cmd [[packadd packer.nvim]]
      return true
   end
   return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
   use "wbthomason/packer.nvim"
   require("plugins.vanilla_plus")(use)

   local ok, ext = pcall(require, "plugins.lsp")
   if ok and ext then
      ext(use)
   end
   ok, ext = pcall(require, "plugins.math")
   if ok and ext then
      ext(use)
   end
   ok, ext = pcall(require, "plugins.languages")
   if ok and ext then
      ext(use)
   end

   if packer_bootstrap then
      require('packer').sync()
   end
end)
